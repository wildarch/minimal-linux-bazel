extern crate hyper;

use hyper::rt::{self, Future};
use hyper::service::service_fn_ok;
use hyper::{Body, Request, Response, Server};
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

// TODO use `ioctl`s for this
fn setup_network() {
    Command::new("/sbin/ip")
        .arg("link")
        .arg("set")
        .arg("eth0")
        .arg("up")
        .status()
        .expect("Failed to bring interface up");

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
