load("@io_bazel_rules_rust//rust:rust.bzl", "rust_binary")

rust_binary(
    name = "application",
    srcs = [
        "src/main.rs",
        "src/network.rs",
    ],
    edition = "2018",
    visibility = ["//visibility:public"],
    deps = [
        "//application/raze:hyper",
        "//application/raze:libc",
        "//application/raze:nix",
    ],
)
