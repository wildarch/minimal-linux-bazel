load("@io_bazel_rules_rust//rust:rust.bzl", "rust_binary")
load("@minimal_linux_bazel//:rootfs.bzl", "rust_rootfs")

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
)

rust_rootfs(
    name = "rootfs",
    out = "initrd.gz",
    init = ":application",
)

genrule(
    name = "image",
    srcs = [
        "@raspberrypi_firmware//:boot_files",
        "@raspberrypi_firmware//:overlays",
        "//:rootfs",
        "config.txt",
    ],
    outs = ["dist.img"],
    cmd = "$(location @minimal_linux_bazel//mkpiimage) $(locations @raspberrypi_firmware//:boot_files) $(location :rootfs) $(location config.txt) --overlays $(locations @raspberrypi_firmware//:overlays) --output $@",
    output_to_bindir = True,
    tools = ["@minimal_linux_bazel//mkpiimage"],
)
