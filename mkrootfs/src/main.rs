///! `mkrootfs` is a command line tool to generate an initial ramdisk (initrd) from a list of
/// files.
///
/// The resulting file is a gzipped cpio archive from the given files.
///
/// # Usage
/// ```bash
/// mkrootfs <FILES ...> <ARCHIVE>
/// ```
///
/// # Example
/// ```bash
/// mkrootfs dev sys proc bin/busybox init rootfs.gz
/// ```
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
        use crate::Error::*;
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

// These are for world read-write-execute permissions
const CPIO_SYMLINK_MODE: u32 = 0o0120777;
const CPIO_FILE_MODE: u32 = 0o0100777;
const CPIO_DIR_MODE: u32 = 0o0040777;

/// The `body` of a cpio archive is dependant on the entry type:
/// * For regular files, the body contains their contents.
/// * For symlinks, the body contains the target path.
/// * For directories, the body is empty.
enum CpioSource {
    Data(io::Cursor<Vec<u8>>),
    File(File),
}

impl CpioSource {
    pub fn symlink_target(target: PathBuf) -> CpioSource {
        let bytes = target.to_string_lossy().as_bytes().to_owned();
        CpioSource::Data(io::Cursor::new(bytes))
    }

    pub fn empty() -> CpioSource {
        CpioSource::Data(io::Cursor::new(Vec::new()))
    }

    pub fn file(file: File) -> CpioSource {
        CpioSource::File(file)
    }
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

fn prep_file(path: PathBuf) -> Result<(NewcBuilder, CpioSource), Error> {
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
        Ok((builder, CpioSource::empty()))
    } else if file_type.is_symlink() {
        let target = fs::read_link(&path).map_err(|e| Error::OpenFile {
            path: path.clone(),
            e,
        })?;
        let builder = NewcBuilder::new(&path.to_string_lossy())
            .uid(0)
            .gid(0)
            .mode(CPIO_SYMLINK_MODE);
        Ok((builder, CpioSource::symlink_target(target)))
    } else {
        let file = File::open(&path).map_err(|e| Error::OpenFile {
            path: path.clone(),
            e,
        })?;
        let builder = NewcBuilder::new(&path.to_string_lossy())
            .uid(0)
            .gid(0)
            .mode(CPIO_FILE_MODE);
        Ok((builder, CpioSource::file(file)))
    }
}

fn run() -> Result<(), Error> {
    let mut files: Vec<PathBuf> = args().skip(1).map(PathBuf::from).collect();
    // Last file is the archive
    let archive = files.pop().ok_or(Error::NoArchivePath)?;
    if files.is_empty() {
        eprintln!("[WARN] No input files specified, archive will be empty.");
    }
    // If we encountered an error for one or more files, fail with the first error.
    let files = files
        .into_iter()
        .map(prep_file)
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
    match run() {
        Ok(()) => {}
        Err(e) => {
            eprintln!("[Error] {}", e);
            std::process::exit(1);
        }
    }
}
