use libc::{c_char, c_short, IFF_UP, IFNAMSIZ, SIOCSIFADDR, SIOCSIFFLAGS, SIOCSIFNETMASK};
use nix::sys::socket::{self, sockaddr, AddressFamily, InetAddr, SockAddr, SockFlag, SockType};
use nix::{convert_ioctl_res, ioctl_write_ptr_bad};
use std::fs::File;
use std::net::{IpAddr, SocketAddr};
use std::os::unix::io::FromRawFd;
use std::ptr;

#[derive(Debug)]
pub enum Error {
    //#[fail(display = "Failed to bring up interface: {}", _0)]
    InterfaceUp(nix::Error),
    //#[fail(display = "Failed to set interface address: {}", _0)]
    Address(nix::Error),
    //#[fail(display = "Failed to set interface netmask: {}", _0)]
    Netmask(nix::Error),
}

pub fn setup(interface: &str, address: IpAddr, netmask: IpAddr) -> Result<(), Error> {
    let sock = socket::socket(
        AddressFamily::Inet,
        SockType::Datagram,
        SockFlag::empty(),
        None,
    )
    // This should never be able to fail.
    .expect("Failed to create ipv4 control socket");
    // Create a file from the socket fd to make sure it is automatically closed when we exit this
    // function (via the Drop impl on File).
    let _sock_file = unsafe { File::from_raw_fd(sock) };

    let req = FlagsRequest::new(interface, IFF_UP as c_short);
    unsafe { set_interface_flags(sock, &req as *const FlagsRequest) }
        .map_err(Error::InterfaceUp)?;

    let req = AddrRequest::new(interface, address);
    unsafe { set_interface_address(sock, &req as *const AddrRequest) }.map_err(Error::Address)?;

    let req = AddrRequest::new(interface, netmask);
    unsafe { set_interface_netmask(sock, &req as *const AddrRequest) }.map_err(Error::Netmask)?;

    Ok(())
}

ioctl_write_ptr_bad!(set_interface_flags, SIOCSIFFLAGS, FlagsRequest);
ioctl_write_ptr_bad!(set_interface_address, SIOCSIFADDR, AddrRequest);
ioctl_write_ptr_bad!(set_interface_netmask, SIOCSIFNETMASK, AddrRequest);

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

#[repr(C)]
pub struct AddrRequest {
    interface_name: [c_char; IFNAMSIZ],
    address: sockaddr,
}

impl AddrRequest {
    pub fn new(interface: &str, address: IpAddr) -> AddrRequest {
        let addr = SockAddr::new_inet(InetAddr::from_std(&SocketAddr::new(address, 0)));
        let (ffi_addr, _len) = unsafe { addr.as_ffi_pair() };
        AddrRequest {
            interface_name: interface_name(interface),
            address: *ffi_addr,
        }
    }
}
