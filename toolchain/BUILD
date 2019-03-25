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

platform(
    name = "armv7-unknown-linux-musleabihf",
    constraint_values = [
        "@bazel_tools//platforms:arm",
        "@bazel_tools//platforms:linux",
        ":musl",
        ":armv7",
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
    name = "rust-armv7-unknown-linux-musleabihf",
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

# Raspberry pi GCC toolchain
cc_toolchain_suite(
    name = "gcc-armv7l-linux-musleabihf",
    toolchains = {
        "armv7l": ":gcc-armv7l-linux-musleabihf_toolchain",
    },
    visibility = ["//visibility:public"],
)

filegroup(
    name = "empty",
    srcs = [],
)

filegroup(
    name = "all_files",
    srcs = [
        "wrappers/armv7l-linux-musleabihf-gcc",
        "@gcc-armv7l-linux-musleabihf//:all_files",
    ],
    visibility = ["//visibility:public"],
)

cc_toolchain(
    name = "gcc-armv7l-linux-musleabihf_toolchain",
    all_files = ":all_files",
    compiler_files = ":all_files",
    cpu = "armv7l",
    dwp_files = ":all_files",
    dynamic_runtime_libs = [":all_files"],
    linker_files = ":all_files",
    objcopy_files = ":all_files",
    static_runtime_libs = [":all_files"],
    strip_files = ":all_files",
    supports_param_files = 0,
    toolchain_identifier = "gcc-armv7l-linux-musleabihf-toolchain",
    visibility = ["//visibility:public"],
)
