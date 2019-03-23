load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_file")

def fetch_musl_toolchain():
    http_file(
        name = "rust-std-1.33.0-x86_64-unknown-linux-musl",
        sha256 = "c3c0bf38140f7108705bbeeeaebd3dd9e23f556d36796779100c8ecf9142da7f",
        urls = ["https://static.rust-lang.org/dist/rust-std-1.33.0-x86_64-unknown-linux-musl.tar.gz"],
    )

    http_file(
        name = "rustc-1.33.0-x86_64-unknown-linux-gnu",
        sha256 = "54a342f718b712d8a17fd7878ebd37d22a82ebc70b59c421168cd4153fd04c2b",
        urls = ["https://static.rust-lang.org/dist/rustc-1.33.0-x86_64-unknown-linux-gnu.tar.gz"],
    )
