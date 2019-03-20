load("@io_bazel_rules_rust//rust:rust.bzl", "rust_binary")

rust_binary(
    name = "application",
    srcs = [
        "src/driver.rs",
        "src/main.rs",
        "src/network.rs",
    ],
    data = ["@e1000"],
    edition = "2018",
    visibility = ["//visibility:public"],
    deps = [
        "//application/raze:hyper",
        "//application/raze:libc",
        "//application/raze:nix",
        "//application/raze:sys_mount",
    ],
)
