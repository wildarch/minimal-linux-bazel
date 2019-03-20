load("@io_bazel_rules_rust//rust:rust.bzl", "rust_binary")
load("//:rootfs.bzl", "rust_rootfs")
load("//:iso_image.bzl", "iso_image")

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

rust_rootfs(
    name = "rootfs",
    out = "rootfs.gz",
    init = "//application",
)

iso_image(
    name = "iso",
    out = "dist.iso",
    rootfs = "rootfs.gz",
)
