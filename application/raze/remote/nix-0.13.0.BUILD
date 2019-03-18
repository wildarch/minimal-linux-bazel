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


# Unsupported target "build-script-build" with type "custom-build" omitted

rust_library(
    name = "nix",
    crate_root = "src/lib.rs",
    crate_type = "lib",
    edition = "2015",
    srcs = glob(["**/*.rs"]),
    deps = [
        "@raze__bitflags__1_0_4//:bitflags",
        "@raze__cfg_if__0_1_7//:cfg_if",
        "@raze__libc__0_2_50//:libc",
        "@raze__void__1_0_2//:void",
    ],
    rustc_flags = [
        "--cap-lints=allow",
    ],
    version = "0.13.0",
    crate_features = [
    ],
)

# Unsupported target "test" with type "test" omitted
# Unsupported target "test-aio-drop" with type "test" omitted
# Unsupported target "test-lio-listio-resubmit" with type "test" omitted
# Unsupported target "test-mount" with type "test" omitted
# Unsupported target "test-ptymaster-drop" with type "test" omitted
