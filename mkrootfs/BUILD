load("@io_bazel_rules_rust//rust:rust.bzl", "rust_binary")

rust_binary(
    name = "mkrootfs",
    srcs = ["src/main.rs"],
    edition = "2018",
    visibility = ["//visibility:public"],
    deps = [
        "//mkrootfs/raze:cpio",
        "//mkrootfs/raze:libflate",
    ],
)
