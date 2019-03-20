load("@io_bazel_rules_rust//rust:rust.bzl", "rust_binary")
load(":rootfs.bzl", "rust_rootfs")
load(":mkiso.bzl", "iso_image")

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
