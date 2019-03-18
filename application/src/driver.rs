use libc::{syscall, SYS_finit_module};
use std::fs::File;
use std::io::Error;
use std::os::unix::io::AsRawFd;

pub fn load(file: File) -> Result<(), Error> {
    let fd = file.as_raw_fd();
    let res = unsafe { syscall(SYS_finit_module, fd, &[0u8; 1], 0) };
    if res < 0 {
        Err(Error::last_os_error())
    } else {
        Ok(())
    }
}
