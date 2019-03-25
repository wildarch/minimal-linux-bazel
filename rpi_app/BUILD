load("@io_bazel_rules_rust//rust:rust.bzl", "rust_binary")

rust_binary(
    name = "application",
    srcs = [
        "src/main.rs",
    ],
    edition = "2018",
    visibility = ["//visibility:public"],
)

cc_binary(
    name = "test",
    srcs = ["main.cc"],
)
