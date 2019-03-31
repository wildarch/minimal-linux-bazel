use std::fs::{self, File, OpenOptions};
use std::io;
use std::path::{Path, PathBuf};

use fatfs::{format_volume, Dir, FileSystem, FormatVolumeOptions, FsOptions, ReadWriteSeek};
use fscommon::BufStream;
use structopt::StructOpt;

// 1 Mb minimum image size
const MIN_IMAGE_SIZE: u64 = 1024 * 1024;

#[derive(Debug, StructOpt)]
#[structopt(
    name = "mkpiimage",
    about = "Creates bootable Raspberry Pi sd card images"
)]
struct Opt {
    /// The set of files to include on the boot partition.
    #[structopt(parse(from_os_str))]
    boot_files: Vec<PathBuf>,
    /// The set of files to include in the overlay/ directory.
    #[structopt(long = "overlays", short = "ol")]
    #[structopt(parse(from_os_str))]
    overlay_files: Vec<PathBuf>,
    #[structopt(long = "output", short = "o")]
    #[structopt(parse(from_os_str))]
    out: PathBuf,
}

fn create_image(path: &Path, size: u64) -> io::Result<BufStream<File>> {
    let img_file = OpenOptions::new()
        .read(true)
        .write(true)
        .create(true)
        .open(path)?;
    // 1 MB
    img_file.set_len(size)?;

    {
        let format_handle = img_file.try_clone()?;
        format_volume(format_handle, FormatVolumeOptions::new())?;
    }

    Ok(BufStream::new(img_file))
}

fn add_file<T: ReadWriteSeek>(dir: &Dir<T>, src: &Path) -> io::Result<()> {
    let mut src_file = File::open(&src)?;
    // Safe to unwrap because there must a file name to be able to open it
    let file_name = src.file_name().unwrap().to_string_lossy();
    let mut target_file = dir.create_file(&file_name)?;
    io::copy(&mut src_file, &mut target_file)?;
    Ok(())
}

fn main() -> io::Result<()> {
    let opt = Opt::from_args();

    let total_size: io::Result<u64> = opt
        .boot_files
        .iter()
        .chain(opt.overlay_files.iter())
        .map(|p| fs::metadata(p).map(|m| m.len()))
        .sum();
    let total_size = total_size?;

    // Size times 1.5 is usually pretty safe
    let image_size = (total_size * 3) / 2;
    let image_size = std::cmp::max(image_size, MIN_IMAGE_SIZE);

    let img_file = create_image(&opt.out, image_size)?;
    let fs = FileSystem::new(img_file, FsOptions::new())?;
    let root = fs.root_dir();
    for path in opt.boot_files {
        add_file(&root, &path)?;
    }

    let overlays = root.create_dir("overlays")?;
    for path in opt.overlay_files {
        add_file(&overlays, &path)?;
    }

    Ok(())
}
