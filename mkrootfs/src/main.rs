extern crate cpio;
extern crate libflate;

use cpio::NewcBuilder;
use libflate::gzip;
use std::env::args;
use std::fmt;
use std::fs::File;
use std::io;
use std::path::PathBuf;

#[derive(Debug)]
enum Error {
    OpenFile { path: PathBuf, e: io::Error },
    CreateFile { path: PathBuf, e: io::Error },
    WriteArchive { e: io::Error },
    NoArchivePath,
}

impl fmt::Display for Error {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        use Error::*;
        match self {
            OpenFile { path, e } => write!(f, "Could not open file {}: {}", path.display(), e),
            CreateFile { path, e } => write!(f, "Could not create file {}: {}", path.display(), e),
            WriteArchive { e } => write!(f, "Error occurred writing archive data: {}", e),
            NoArchivePath => write!(
                f,
                "No archive path was specified, 
                use the argument format: <FILES ...> ARCHVE"
            ),
        }
    }
}

fn prep_file(path: PathBuf) -> Result<(NewcBuilder, File), Error> {
    let file = File::open(&path).map_err(|e| Error::OpenFile {
        path: path.clone(),
        e,
    })?;
    let builder = NewcBuilder::new(&path.to_string_lossy()).uid(0).gid(0);
    Ok((builder, file))
}

fn run() -> Result<(), Error> {
    let mut files: Vec<PathBuf> = args().skip(1).map(PathBuf::from).collect();
    // Last file is the archive
    let archive = files.pop().ok_or(Error::NoArchivePath)?;
    if files.is_empty() {
        eprintln!("[WARN] No input files specified, archive will be empty.");
    }
    let files = files
        .into_iter()
        .map(prep_file)
        .collect::<Result<Vec<_>, _>>()?;

    let archive = File::create(&archive).map_err(|e| Error::CreateFile { path: archive, e })?;

    // Wrap in gzip encoder
    let archive = gzip::Encoder::new(archive).map_err(|e| Error::WriteArchive { e })?;

    let archive =
        cpio::write_cpio(files.into_iter(), archive).map_err(|e| Error::WriteArchive { e })?;

    // Finish the archive (write trailer)
    archive
        .finish()
        .into_result()
        .map_err(|e| Error::WriteArchive { e })?;
    Ok(())
}

fn main() {
    match run() {
        Ok(()) => {}
        Err(e) => {
            eprintln!("[Error] {}", e);
            std::process::exit(1);
        }
    }
}
