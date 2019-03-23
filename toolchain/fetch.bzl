load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive", "http_file")
load("@io_bazel_rules_rust//rust:repositories.bzl", "rust_toolchain_repository")

def fetch_toolchains():
    rust_toolchain_repository(
        name = "rust-1.33.0",
        exec_triple = "x86_64-unknown-linux-gnu",
        extra_target_triples = [
            "x86_64-unknown-linux-musl",
            "armv7-unknown-linux-musleabihf",
        ],
        toolchain_name_prefix = "mlb_rust_toolchain",
        version = "1.33.0",
    )

    native.register_toolchains(
        "@minimal_linux_bazel//toolchain:rust-x86_64-unknown-linux-gnu",
        "@minimal_linux_bazel//toolchain:rust-x86_64-unknown-linux-musl",
        "@minimal_linux_bazel//toolchain:armv7-unknown-linux-musleabihf",
    )
