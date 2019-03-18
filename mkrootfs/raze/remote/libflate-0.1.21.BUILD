"""
cargo-raze crate build file.

DO NOT EDIT! Replaced on runs of cargo-raze
"""
package(default_visibility = [
  # Public for visibility by "@raze__crate__version//" targets.
  #
  # Prefer access through "//mkrootfs/raze", which limits external
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


# Unsupported target "flate" with type "example" omitted

rust_library(
    name = "libflate",
    crate_root = "src/lib.rs",
    crate_type = "lib",
    edition = "2015",
    srcs = glob(["**/*.rs"]),
    deps = [
        "@raze__adler32__1_0_3//:adler32",
        "@raze__byteorder__1_3_1//:byteorder",
        "@raze__crc32fast__1_2_0//:crc32fast",
    ],
    rustc_flags = [
        "--cap-lints=allow",
    ],
    version = "0.1.21",
    crate_features = [
    ],
)

