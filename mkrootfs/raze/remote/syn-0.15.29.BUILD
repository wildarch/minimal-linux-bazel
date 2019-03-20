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
  "notice", # "MIT,Apache-2.0"
])

load(
    "@io_bazel_rules_rust//rust:rust.bzl",
    "rust_library",
    "rust_binary",
    "rust_test",
)


# Unsupported target "build-script-build" with type "custom-build" omitted

rust_library(
    name = "syn",
    crate_root = "src/lib.rs",
    crate_type = "lib",
    edition = "2015",
    srcs = glob(["**/*.rs"]),
    deps = [
        "@raze__proc_macro2__0_4_27//:proc_macro2",
        "@raze__quote__0_6_11//:quote",
        "@raze__unicode_xid__0_1_0//:unicode_xid",
    ],
    rustc_flags = [
        "--cap-lints=allow",
    ],
    version = "0.15.29",
    crate_features = [
        "clone-impls",
        "default",
        "derive",
        "extra-traits",
        "parsing",
        "printing",
        "proc-macro",
        "proc-macro2",
        "quote",
        "visit",
    ],
)

