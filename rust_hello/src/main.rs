mod network;

use actix_web::{http, server, App, Path, Responder};

fn index(name: Path<String>) -> impl Responder {
    format!("Hello {}!", &name)
}

fn main() {
    network::setup("eth0", [10, 0, 2, 15].into(), [255, 255, 255, 0].into())
        .expect("Failed to setup network");
    println!("Network configured");

    server::new(|| App::new().route("/{name}", http::Method::GET, index))
        .bind("0.0.0.0:3000")
        .unwrap()
        .run();
}
