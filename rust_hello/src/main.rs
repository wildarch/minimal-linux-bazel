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

// Set interface flags
use libc::{c_char, c_short, IFF_UP, IFNAMSIZ, SIOCSIFFLAGS};
use std::ptr;

#[repr(C)]
pub struct FlagsRequest {
    interface_name: [c_char; IFNAMSIZ],
    flags: c_short,
}

fn interface_name(interface: &str) -> [c_char; IFNAMSIZ] {
    let mut interface_name = [0; IFNAMSIZ];
    if interface.len() > IFNAMSIZ - 1 {
        // TODO should we really panic here, or just return an error?
        panic!(
            "Interface name `{}` is too long, maximum length is {} characters",
            interface,
            IFNAMSIZ - 1
        );
    }
    // Copy the interface name into the designated array.
    // This copy is safe, as we have checked that interface.len() is no greater than
    // IFNAMSIZ - 1.
    unsafe {
        ptr::copy(
            interface.as_ptr() as *const c_char,
            interface_name.as_mut_ptr() as *mut c_char,
            interface.len(),
        )
    };
    interface_name
}

impl FlagsRequest {
    pub fn new(interface: &str, flags: c_short) -> FlagsRequest {
        FlagsRequest {
            interface_name: interface_name(interface),
            flags,
        }
    }
}

ioctl_write_ptr_bad!(set_interface_flags, SIOCSIFFLAGS, FlagsRequest);

// Set interface address
ioctl_write_ptr_bad!(set_interface_address, SIOCSIFADDR, AddrRequest);

use libc::{sockaddr, SIOCSIFADDR};
use socket2::SockAddr;
use std::net::{IpAddr, SocketAddr};

#[repr(C)]
pub struct AddrRequest {
    interface_name: [c_char; IFNAMSIZ],
    address: sockaddr,
}

impl AddrRequest {
    pub fn new(interface: &str, address: IpAddr) -> AddrRequest {
        let addr = SockAddr::from(SocketAddr::new(address, 0));
        AddrRequest {
            interface_name: interface_name(interface),
            address: unsafe { *addr.as_ptr() },
        }
    }
}

// TODO use `ioctl`s for this
fn setup_network() {
    let sock = socket::socket(
        AddressFamily::Inet,
        SockType::Datagram,
        SockFlag::empty(),
        None,
    )
    .unwrap();

    let req = FlagsRequest::new("eth0", IFF_UP as c_short);
    unsafe { set_interface_flags(sock, &req as *const FlagsRequest).expect("Failed to set flags") };

    let req = AddrRequest::new("eth0", "10.0.2.15".parse().unwrap());
    unsafe {
        set_interface_address(sock, &req as *const AddrRequest)
            .expect("Failed to set interface address")
    };
    unsafe { libc::close(sock) };

    Command::new("/sbin/ip")
        .arg("route")
        .arg("add")
        .arg("10.0.2.0/24")
        .arg("dev")
        .arg("eth0")
        .status()
        .expect("Failed to configure routes");
}
