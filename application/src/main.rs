mod network;

use hyper::rt::{self, Future};
use hyper::service::service_fn_ok;
use hyper::{Body, Request, Response, Server};
use libc::{syscall, SYS_finit_module};
use std::fs::File;
use std::io;
use std::net::{IpAddr, Ipv4Addr, SocketAddr};
use std::os::unix::io::AsRawFd;

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

    let addr = SocketAddr::new(ip, 3000);
    let server = Server::bind(&addr)
        .serve(|| {
            // This is the `Service` that will handle the connection.
            // `service_fn_ok` is a helper to convert a function that
            // returns a Response into a `Service`.
            service_fn_ok(move |_: Request<Body>| Response::new(Body::from("Hello World!")))
        })
        .map_err(|e| eprintln!("server error: {}", e));

    println!("Listening on http://{}", addr);

    rt::run(server);
}
