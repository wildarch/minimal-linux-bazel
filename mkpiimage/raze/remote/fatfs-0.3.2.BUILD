"""
cargo-raze crate build file.

DO NOT EDIT! Replaced on runs of cargo-raze
"""
package(default_visibility = [
  # Public for visibility by "@raze__crate__version//" targets.
  #
  # Prefer access through "//mkpiimage/raze", which limits external
  # visibility to explicit Cargo.toml dependencies.
  "//visibility:public",
])

licenses([
  "notice", # "MIT"
])

load(
    "@io_bazel_rules_rust//rust:rust.bzl",
    "rust_library",
    "rust_binary",
    "rust_test",
)


# Unsupported target "cat" with type "example" omitted

rust_library(
    name = "fatfs",
    crate_root = "src/lib.rs",
    crate_type = "lib",
    edition = "2015",
    srcs = glob(["**/*.rs"]),
    deps = [
        "@raze__bitflags__1_0_4//:bitflags",
        "@raze__byteorder__1_3_1//:byteorder",
        "@raze__chrono__0_4_6//:chrono",
        "@raze__log__0_4_6//:log",
    ],
    rustc_flags = [
        "--cap-lints=allow",
    ],
    version = "0.3.2",
    crate_features = [
        "alloc",
        "chrono",
        "default",
        "std",
    ],
)

# Unsupported target "format" with type "test" omitted
# Unsupported target "ls" with type "example" omitted
# Unsupported target "mkfatfs" with type "example" omitted
# Unsupported target "partition" with type "example" omitted
# Unsupported target "read" with type "test" omitted
# Unsupported target "write" with type "example" omitted
# Unsupported target "write" with type "test" omitted
