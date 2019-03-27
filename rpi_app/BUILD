load("@io_bazel_rules_rust//rust:rust.bzl", "rust_binary")

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
