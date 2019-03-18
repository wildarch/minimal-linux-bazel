"""
cargo-raze crate build file.

DO NOT EDIT! Replaced on runs of cargo-raze
"""
package(default_visibility = [
  # Public for visibility by "@raze__crate__version//" targets.
  #
  # Prefer access through "//application/raze", which limits external
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


# Unsupported target "mount" with type "example" omitted

rust_library(
    name = "sys_mount",
    crate_root = "src/lib.rs",
    crate_type = "lib",
    edition = "2015",
    srcs = glob(["**/*.rs"]),
    deps = [
        "@raze__bitflags__1_0_4//:bitflags",
        "@raze__libc__0_2_50//:libc",
        "@raze__loopdev__0_2_1//:loopdev",
    ],
    rustc_flags = [
        "--cap-lints=allow",
    ],
    version = "1.2.0",
    crate_features = [
    ],
)

# Unsupported target "umount" with type "example" omitted
