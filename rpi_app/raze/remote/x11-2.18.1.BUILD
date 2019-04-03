"""
cargo-raze crate build file.

DO NOT EDIT! Replaced on runs of cargo-raze
"""
package(default_visibility = [
  # Public for visibility by "@raze__crate__version//" targets.
  #
  # Prefer access through "//raze", which limits external
  # visibility to explicit Cargo.toml dependencies.
  "//visibility:public",
])

licenses([
  "unencumbered", # "CC0-1.0"
])

load(
    "@io_bazel_rules_rust//rust:rust.bzl",
    "rust_library",
    "rust_binary",
    "rust_test",
)


# Unsupported target "build-script-build" with type "custom-build" omitted
# Unsupported target "hello-world" with type "example" omitted
# Unsupported target "input" with type "example" omitted

rust_library(
    name = "x11",
    crate_root = "src/lib.rs",
    crate_type = "lib",
    edition = "2015",
    srcs = glob(["**/*.rs"]),
    deps = [
        "@raze__libc__0_2_51//:libc",
        "@libx11",
    ],
    rustc_flags = [
        "--cap-lints=allow",
    ],
    version = "2.18.1",
    crate_features = [
        "xlib",
    ],
)

# Unsupported target "xrecord" with type "example" omitted
