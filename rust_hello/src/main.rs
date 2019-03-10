mod network;

use actix_web::{http, server, App, Path, Responder};
use libc::{syscall, SYS_finit_module};
use std::fs::File;
use std::io;
use std::net::{IpAddr, Ipv4Addr, SocketAddr};
use std::os::unix::io::AsRawFd;

fn index(name: Path<String>) -> impl Responder {
    format!("Hello {}!", &name)
}

fn main() {
    let driver = File::open("/e1000.ko").expect("Could not open driver");
    let fd = driver.as_raw_fd();
    let res = unsafe { syscall(SYS_finit_module, fd, &[0u8; 1], 0) };
    if res < 0 {
        println!(
            "Failed to load kernel module: {}",
            io::Error::last_os_error()
        );
    } else {
        println!("Loaded kernel module");
    }

    let ip: IpAddr = Ipv4Addr::new(10, 0, 2, 15).into();
    let netmask = Ipv4Addr::new(255, 255, 255, 0).into();
    network::setup("eth0", ip.clone(), netmask).expect("Failed to setup network");
    println!("Network configured");

    server::new(|| App::new().route("/{name}", http::Method::GET, index))
        .bind(SocketAddr::new(ip, 3000))
        .unwrap()
        .run();
}
