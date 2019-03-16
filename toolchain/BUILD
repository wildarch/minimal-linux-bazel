load("@io_bazel_rules_rust//rust:toolchain.bzl", "rust_toolchain")

constraint_setting(name = "libc")

constraint_value(
    name = "musl",
    constraint_setting = ":libc",
)

constraint_value(
    name = "gnu",
    constraint_setting = ":libc",
)

platform(
    name = "linux-musl",
    constraint_values = [
        "@bazel_tools//platforms:x86_64",
        ":musl",
    ],
)

rust_toolchain(
    name = "rust-x86_64-unknown-linux-musl_impl",
    default_edition = "2015",
    dylib_ext = ".so",
    exec_triple = "x86_64-unknown-linux-gnu",
    os = "linux",
    rust_doc = "bin/rustdoc",
    rust_lib = ":rust_lib",
    rustc = "bin/rustc",
    rustc_lib = ":rustc_lib",
    staticlib_ext = ".a",
    target_triple = "x86_64-unknown-linux-musl",
    visibility = ["//visibility:public"],
)

toolchain(
    name = "rust-x86_64-unknown-linux-musl",
    exec_compatible_with = [
        "@bazel_tools//platforms:x86_64",
    ],
    target_compatible_with = [
        "@bazel_tools//platforms:x86_64",
        ":musl",
    ],
    toolchain = "rust-x86_64-unknown-linux-musl_impl",
    toolchain_type = "@io_bazel_rules_rust//rust:toolchain",
    visibility = ["//visibility:public"],
)

RUSTC_FILES = [
    "lib/librustc_allocator-82e3cd5d9b076e65.so",
    "lib/librustc_privacy-4b536c479d850adc.so",
    "lib/librustc_resolve-ef9e431eac932f47.so",
    "lib/librustc_incremental-3c2bb1d5fc419bfa.so",
    "lib/libtest-c3a0bad6f0180507.so",
    "lib/librustc_traits-8eb2c0af9eca981f.so",
    "lib/librustc_save_analysis-1be57f469cb11f86.so",
    "lib/libgraphviz-ad4130a5cb6b83e5.so",
    "lib/libsyntax_ext-93c95ebb2947da95.so",
    "lib/librustc_typeck-8a8c252a1a3f1acf.so",
    "lib/librustc_codegen_utils-353fc8c3c9a64843.so",
    "lib/libserialize-2e09cdf7b584221c.so",
    "lib/librustc_fs_util-a382ef6de61509d9.so",
    "lib/librustc_errors-0d6b496c4f85bc11.so",
    "lib/libLLVM-8svn.so",
    "lib/libsyntax_pos-080002774c43a4da.so",
    "lib/librustc_driver-98cc830c22797a9f.so",
    "lib/librustc_borrowck-e8d0c2c47af2a6b2.so",
    "lib/libstd-e39317eb74365d3c.so",
    "lib/librustc-f836d451b4727421.so",
    "lib/librustc_plugin-d723464ef9a89252.so",
    "lib/libsyntax-4a96b8a53fc3ab02.so",
    "lib/librustc_lint-2c2c21c1130b9eb6.so",
    "lib/librustc_passes-b3497d93476c0210.so",
    "lib/libarena-fc3c5e79c3d251f5.so",
    "lib/librustc_target-682725eeaaa56e2f.so",
    "lib/librustc_cratesio_shim-0d76e74d4fdc114c.so",
    "lib/libfmt_macros-610169ef8a9e6883.so",
    "lib/librustc_data_structures-29c8ff7a57dfcf55.so",
    "lib/librustc_mir-67524754d7bf4773.so",
    "lib/librustc_codegen_ssa-f18ca8ed615441f6.so",
    "lib/libterm-6540918622214377.so",
    "lib/librustc_metadata-95b6cd3fd93690c6.so",
    "lib/rustlib/x86_64-unknown-linux-gnu/lib/libLLVM-8svn.so",
    "lib/rustlib/x86_64-unknown-linux-gnu/bin/rust-lld",
    "lib/rustlib/x86_64-unknown-linux-gnu/codegen-backends/librustc_codegen_llvm-llvm.so",
    "lib/rustlib/x86_64-unknown-linux-gnu/codegen-backends/librustc_codegen_llvm-emscripten.so",
]

filegroup(
    name = "rustc_lib",
    srcs = RUSTC_FILES,
)

RUST_STD_FILES = [
    "lib/rustlib/x86_64-unknown-linux-musl/lib/crtn.o",
    "lib/rustlib/x86_64-unknown-linux-musl/lib/libcompiler_builtins-851bb3b5f6c4db49.rlib",
    "lib/rustlib/x86_64-unknown-linux-musl/lib/libproc_macro-6836399d56086c5f.rlib",
    "lib/rustlib/x86_64-unknown-linux-musl/lib/libpanic_unwind-4d55a38564aae54a.rlib",
    "lib/rustlib/x86_64-unknown-linux-musl/lib/librustc_demangle-0ad27b9879d551d3.rlib",
    "lib/rustlib/x86_64-unknown-linux-musl/lib/libgetopts-50a203aae2e8a340.rlib",
    "lib/rustlib/x86_64-unknown-linux-musl/lib/libcore-6a9d233d01acc350.rlib",
    "lib/rustlib/x86_64-unknown-linux-musl/lib/crt1.o",
    "lib/rustlib/x86_64-unknown-linux-musl/lib/libbacktrace_sys-f8521075e248b627.rlib",
    "lib/rustlib/x86_64-unknown-linux-musl/lib/libstd-af9362ed5d81a840.rlib",
    "lib/rustlib/x86_64-unknown-linux-musl/lib/libunwind-7c91ffdc8da860d3.rlib",
    "lib/rustlib/x86_64-unknown-linux-musl/lib/liblibc-588f18eae3ea58be.rlib",
    "lib/rustlib/x86_64-unknown-linux-musl/lib/librustc_std_workspace_core-8895b32baedb08c6.rlib",
    "lib/rustlib/x86_64-unknown-linux-musl/lib/libterm-6540918622214377.rlib",
    "lib/rustlib/x86_64-unknown-linux-musl/lib/liballoc-4ebf5caee903d98f.rlib",
    "lib/rustlib/x86_64-unknown-linux-musl/lib/crti.o",
    "lib/rustlib/x86_64-unknown-linux-musl/lib/libtest-c3a0bad6f0180507.rlib",
    "lib/rustlib/x86_64-unknown-linux-musl/lib/libpanic_abort-9bf16624dd05c0fb.rlib",
]

filegroup(
    name = "rust_lib",
    srcs = RUST_STD_FILES,
)

FILES = RUSTC_FILES + RUST_STD_FILES + [
    "bin/rustc",
    "bin/rustdoc",
]

MV_CMDS = " && ".join(["mv {0} $(location {0})".format(f) for f in FILES])

genrule(
    name = "assemble",
    srcs = [
        "@rust-std-1.33.0-x86_64-unknown-linux-musl//file",
        "@rustc-1.33.0-x86_64-unknown-linux-gnu//file",
    ],
    outs = FILES,
    cmd = "tar xf \
            $(location @rust-std-1.33.0-x86_64-unknown-linux-musl//file) \
            --strip-components=2 \
            rust-std-1.33.0-x86_64-unknown-linux-musl/rust-std-x86_64-unknown-linux-musl/ \
            && \
            tar xf $(location @rustc-1.33.0-x86_64-unknown-linux-gnu//file) \
            --strip-components=2 \
            rustc-1.33.0-x86_64-unknown-linux-gnu/rustc/ \
            && " + MV_CMDS,
)
