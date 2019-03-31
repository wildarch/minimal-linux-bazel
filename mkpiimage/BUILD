load("@io_bazel_rules_rust//rust:rust.bzl", "rust_binary")

rust_binary(
    name = "mkpiimage",
    srcs = ["src/main.rs"],
    edition = "2018",
    visibility = ["//visibility:public"],
    deps = [
        "//mkpiimage/raze:fatfs",
        "//mkpiimage/raze:fscommon",
        "//mkpiimage/raze:structopt",
    ],
)
