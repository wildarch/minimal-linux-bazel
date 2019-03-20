use cpio::NewcBuilder;
use failure::Fail;
use libflate::gzip;
use std::fmt;
use std::fs::File;
use std::io;
use std::path::{Path, PathBuf};
use structopt::StructOpt;

#[derive(Debug, StructOpt)]
#[structopt(
    name = "mkrootfs",
    about = "A tool to generate an initial ramdisk (initrd) from a list of files."
)]
struct Opt {
    /// Path to the executable that should run as "init".
    #[structopt(short = "i", long = "init")]
    #[structopt(parse(from_os_str))]
    init: PathBuf,

    /// Files needed by the init executable.
    #[structopt(parse(from_os_str))]
    files: Vec<PathBuf>,

    /// The target archive name.
    #[structopt(short = "o", long = "output")]
    #[structopt(parse(from_os_str))]
    archive: PathBuf,
}

#[derive(Debug, Fail)]
enum Error {
    OpenFile { path: PathBuf, e: io::Error },
    CreateFile { path: PathBuf, e: io::Error },
    WriteArchive { e: io::Error },
}

impl fmt::Display for Error {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        use crate::Error::*;
        match self {
            OpenFile { path, e } => write!(f, "Could not open file {}: {}", path.display(), e),
            CreateFile { path, e } => write!(f, "Could not create file {}: {}", path.display(), e),
            WriteArchive { e } => write!(f, "Error occurred writing archive data: {}", e),
        }
    }
}

// These are for world read-write-execute permissions
const CPIO_FILE_MODE: u32 = 0o0100777;

fn prep_file(path: &Path, is_init: bool) -> Result<(NewcBuilder, File), Error> {
    let file = File::open(path).map_err(|e| Error::OpenFile {
        path: path.to_owned(),
        e,
    })?;
    let file_name = if is_init {
        "init".to_owned()
    } else {
        path.file_name().unwrap().to_string_lossy().into_owned()
    };
    let builder = NewcBuilder::new(&file_name)
        .uid(0)
        .gid(0)
        .mode(CPIO_FILE_MODE);
    Ok((builder, file))
}

fn run(opt: Opt) -> Result<(), Error> {
    // TODO handle input

    let archive = opt.archive.clone();
    // If we encountered an error for one or more files, fail with the first error.
    let init = &opt.init;
    let files = opt
        .files
        .into_iter()
        .map(|f| prep_file(&f, &f == init))
        .collect::<Result<Vec<_>, _>>()?;

    let archive = File::create(&archive).map_err(|e| Error::CreateFile { path: archive, e })?;

    // Wrap the file in a gzip encoder, so the CPIO writer will write gzipped data to disk.
    let archive = gzip::Encoder::new(archive).map_err(|e| Error::WriteArchive { e })?;

    let archive =
        cpio::write_cpio(files.into_iter(), archive).map_err(|e| Error::WriteArchive { e })?;

    // Finish the archive (write the trailer)
    archive
        .finish()
        .into_result()
        .map_err(|e| Error::WriteArchive { e })?;
    Ok(())
}

fn main() {
    let opt = Opt::from_args();
    match run(opt) {
        Ok(()) => {}
        Err(e) => {
            eprintln!("[Error] {}", e);
            std::process::exit(1);
        }
    }
}
