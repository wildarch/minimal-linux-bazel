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
  "notice", # "Apache-2.0,MIT"
])

load(
    "@io_bazel_rules_rust//rust:rust.bzl",
    "rust_library",
    "rust_binary",
    "rust_test",
)



rust_library(
    name = "structopt_derive",
    crate_root = "src/lib.rs",
    crate_type = "proc-macro",
    edition = "2015",
    srcs = glob(["**/*.rs"]),
    deps = [
        "@raze__heck__0_3_1//:heck",
        "@raze__proc_macro2__0_4_27//:proc_macro2",
        "@raze__quote__0_6_11//:quote",
        "@raze__syn__0_15_29//:syn",
    ],
    rustc_flags = [
        "--cap-lints=allow",
    ],
    version = "0.2.15",
    crate_features = [
    ],
)

