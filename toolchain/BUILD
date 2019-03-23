load("@io_bazel_rules_rust//rust:toolchain.bzl", "rust_toolchain")

constraint_setting(name = "libc")

constraint_value(
    name = "musl",
    constraint_setting = ":libc",
)

constraint_setting(name = "arm_version")

constraint_value(
    name = "armv7",
    constraint_setting = ":arm_version",
)

platform(
    name = "x86_64-unknown-linux-musl",
    constraint_values = [
        "@bazel_tools//platforms:x86_64",
        "@bazel_tools//platforms:linux",
        ":musl",
    ],
    visibility = ["//visibility:public"],
)

# Host toolchain
toolchain(
    name = "rust-x86_64-unknown-linux-gnu",
    exec_compatible_with = [
        "@bazel_tools//platforms:x86_64",
        "@bazel_tools//platforms:linux",
    ],
    target_compatible_with = [
        "@bazel_tools//platforms:x86_64",
        "@bazel_tools//platforms:linux",
    ],
    toolchain = "@rust-1.33.0//:mlb_rust_toolchain_x86_64-unknown-linux-gnu_impl",
    toolchain_type = "@io_bazel_rules_rust//rust:toolchain",
    visibility = ["//visibility:public"],
)

# Intel/AMD x86_64
toolchain(
    name = "rust-x86_64-unknown-linux-musl",
    exec_compatible_with = [
        "@bazel_tools//platforms:x86_64",
        "@bazel_tools//platforms:linux",
    ],
    target_compatible_with = [
        "@bazel_tools//platforms:x86_64",
        "@bazel_tools//platforms:linux",
        ":musl",
    ],
    toolchain = "@rust-1.33.0//:mlb_rust_toolchain_x86_64-unknown-linux-musl_impl",
    toolchain_type = "@io_bazel_rules_rust//rust:toolchain",
    visibility = ["//visibility:public"],
)

# Raspberry pi 2 and 3 (armv7)
toolchain(
    name = "armv7-unknown-linux-musleabihf",
    exec_compatible_with = [
        "@bazel_tools//platforms:x86_64",
        "@bazel_tools//platforms:linux",
    ],
    target_compatible_with = [
        "@bazel_tools//platforms:arm",
        "@bazel_tools//platforms:linux",
        ":musl",
        ":armv7",
    ],
    toolchain = "@rust-1.33.0//:mlb_rust_toolchain_armv7-unknown-linux-musleabihf_impl",
    toolchain_type = "@io_bazel_rules_rust//rust:toolchain",
    visibility = ["//visibility:public"],
)
