extern crate hyper;
extern crate libc;
#[macro_use]
extern crate nix;

use hyper::rt::{self, Future};
use hyper::service::service_fn_ok;
use hyper::{Body, Request, Response, Server};
use nix::sys::socket::{self, AddressFamily, SockFlag, SockType};
use std::process::Command;

fn main() {
    println!("Setting up network");
    setup_network();
    println!("Network configured");

    let addr = ([0, 0, 0, 0], 3000).into();

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

use libc::{c_char, c_short, IFF_UP, IFNAMSIZ, SIOCSIFFLAGS};

#[repr(C)]
pub struct FlagsRequest {
    interface_name: [c_char; IFNAMSIZ],
    flags: c_short,
}

ioctl_write_ptr_bad!(set_interface_flags, SIOCSIFFLAGS, FlagsRequest);

// TODO use `ioctl`s for this
fn setup_network() {
    let sock = socket::socket(
        AddressFamily::Inet,
        SockType::Datagram,
        SockFlag::empty(),
        None,
    )
    .unwrap();

    let mut interface_name = [0; IFNAMSIZ];
    interface_name[0] = 'e' as c_char;
    interface_name[1] = 't' as c_char;
    interface_name[2] = 'h' as c_char;
    interface_name[3] = '0' as c_char;

    let req = FlagsRequest {
        interface_name,
        flags: IFF_UP as i16,
    };
    unsafe { set_interface_flags(sock, &req as *const FlagsRequest).expect("Failed to set flags") };
    unsafe { libc::close(sock) };

    Command::new("/sbin/ip")
        .arg("addr")
        .arg("add")
        .arg("10.0.2.15")
        .arg("dev")
        .arg("eth0")
        .status()
        .expect("Add interface address");

    Command::new("/sbin/ip")
        .arg("route")
        .arg("add")
        .arg("10.0.2.0/24")
        .arg("dev")
        .arg("eth0")
        .status()
        .expect("Failed to configure routes");
}
