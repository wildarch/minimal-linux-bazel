extern crate cpio;
extern crate libflate;

use cpio::NewcBuilder;
use libflate::gzip;
use std::env::args;
use std::fmt;
use std::fs::{self, File};
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

const CPIO_SYMLINK_MODE: u32 = 0o0120777;
const CPIO_FILE_MODE: u32 = 0o0100777;
const CPIO_DIR_MODE: u32 = 0o0040777;

enum CpioSource {
    Data(io::Cursor<Vec<u8>>),
    File(File),
}

impl io::Read for CpioSource {
    fn read(&mut self, buf: &mut [u8]) -> io::Result<usize> {
        match self {
            CpioSource::Data(data) => data.read(buf),
            CpioSource::File(file) => file.read(buf),
        }
    }
}

impl io::Seek for CpioSource {
    fn seek(&mut self, pos: io::SeekFrom) -> io::Result<u64> {
        match self {
            CpioSource::Data(data) => data.seek(pos),
            CpioSource::File(file) => file.seek(pos),
        }
    }
}

fn prep_file(path: PathBuf) -> Result<Option<(NewcBuilder, CpioSource)>, Error> {
    let metadata = fs::symlink_metadata(&path).map_err(|e| Error::OpenFile {
        path: path.clone(),
        e,
    })?;
    let file_type = metadata.file_type();
    if file_type.is_dir() {
        // Skip directories
        let builder = NewcBuilder::new(&path.to_string_lossy())
            .uid(0)
            .gid(0)
            .mode(CPIO_DIR_MODE);
        Ok(Some((
            builder,
            CpioSource::Data(io::Cursor::new(Vec::new())),
        )))
    } else if file_type.is_symlink() {
        let target = fs::read_link(&path).map_err(|e| Error::OpenFile {
            path: path.clone(),
            e,
        })?;
        let bytes = target.to_string_lossy().as_bytes().to_owned();
        let builder = NewcBuilder::new(&path.to_string_lossy())
            .uid(0)
            .gid(0)
            .mode(CPIO_SYMLINK_MODE);
        Ok(Some((builder, CpioSource::Data(io::Cursor::new(bytes)))))
    } else {
        let file = File::open(&path).map_err(|e| Error::OpenFile {
            path: path.clone(),
            e,
        })?;
        let builder = NewcBuilder::new(&path.to_string_lossy())
            .uid(0)
            .gid(0)
            .mode(CPIO_FILE_MODE);
        Ok(Some((builder, CpioSource::File(file))))
    }
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

    let archive = cpio::write_cpio(files.into_iter().filter_map(|x| x), archive)
        .map_err(|e| Error::WriteArchive { e })?;

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
