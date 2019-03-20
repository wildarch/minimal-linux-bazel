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


# Unsupported target "backtrace" with type "example" omitted

rust_library(
    name = "backtrace",
    crate_root = "src/lib.rs",
    crate_type = "lib",
    edition = "2015",
    srcs = glob(["**/*.rs"]),
    deps = [
        "@raze__backtrace_sys__0_1_28//:backtrace_sys",
        "@raze__cfg_if__0_1_7//:cfg_if",
        "@raze__libc__0_2_50//:libc",
        "@raze__rustc_demangle__0_1_13//:rustc_demangle",
    ],
    rustc_flags = [
        "--cap-lints=allow",
    ],
    version = "0.3.14",
    crate_features = [
        "backtrace-sys",
        "coresymbolication",
        "dbghelp",
        "default",
        "dladdr",
        "libbacktrace",
        "libunwind",
        "std",
    ],
)

# Unsupported target "build-script-build" with type "custom-build" omitted
# Unsupported target "long_fn_name" with type "test" omitted
# Unsupported target "raw" with type "example" omitted
# Unsupported target "skip_inner_frames" with type "test" omitted
# Unsupported target "smoke" with type "test" omitted
