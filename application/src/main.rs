mod driver;
mod network;

use hyper::rt::{self, Future};
use hyper::service::service_fn_ok;
use hyper::{Body, Request, Response, Server};
use std::fs::File;
use std::net::{IpAddr, Ipv4Addr, SocketAddr};
use sys_mount::{Mount, MountFlags};

fn main() {
    // Configure file systems
    Mount::new("none", "/dev", "devtmpfs", MountFlags::empty(), None)
        .expect("Failed to mount /dev");
    Mount::new("none", "/proc", "proc", MountFlags::empty(), None).expect("Failed to mount /proc");
    Mount::new("none", "/sys", "sysfs", MountFlags::empty(), None).expect("Failed to mount /sys");

    // Load ethernet driver
    let driver_file = File::open("/e1000.ko").expect("Could not open driver");
    driver::load(driver_file).expect("Failed to load ethernet driver");

    // Setup the network
    let ip: IpAddr = Ipv4Addr::new(10, 0, 2, 15).into();
    let netmask = Ipv4Addr::new(255, 255, 255, 0).into();
    network::setup("eth0", ip.clone(), netmask).expect("Failed to setup network");
    println!("Network configured");

    // Start web server
    let addr = SocketAddr::new(ip, 3000);
    let server = Server::bind(&addr)
        .serve(|| {
            // This is the `Service` that will handle the connection.
            // `service_fn_ok` is a helper to convert a function that
            // returns a Response into a `Service`.
            service_fn_ok(move |_: Request<Body>| Response::new(Body::from("Hello World!\n")))
        })
        .map_err(|e| eprintln!("server error: {}", e));

    println!("Listening on http://{}", addr);

    rt::run(server);
}
