load("@io_bazel_rules_rust//rust:rust.bzl", "rust_binary")
load("@minimal_linux_bazel//:rootfs.bzl", "rust_rootfs")
load("@minimal_linux_bazel//:raspberry_pi.bzl", "rpi_image")

rust_binary(
    name = "application",
    srcs = [
        "src/main.rs",
    ],
    # This is actually a dirty hack to expose the linker executable to rustc.
    data = [
        "@minimal_linux_bazel//toolchain:all_files",
    ],
    edition = "2018",
    visibility = ["//visibility:public"],
    deps = [
        "//raze:x11",
    ],
)

rust_rootfs(
    name = "rootfs",
    out = "initrd.gz",
    init = ":application",
)

rpi_image(
    name = "image",
    out = "dist.img",
    boot_files = ["@raspberrypi_firmware//:boot_files"],
    overlays = ["@raspberrypi_firmware//:overlays"],
    rootfs = ":rootfs",
)

sh_binary(
    name = "qemu_run",
    srcs = [
        "qemu_run.sh",
    ],
    data = [
        ":rootfs",
        "@raspberrypi_firmware//:kernel7",
        "@raspberrypi_firmware//:rpi2-dtb",
    ],
)
