workspace(name = "minimal_linux_bazel")

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive", "http_file")

# Kernel and drivers
load("//:kernel.bzl", "kernel_driver", "kernel_repository")

KERNEL_SHA256 = "5b22a60437f2604166679c29a08b51b4a6696829378a60ab745ae9f5a0b2d932"

KERNEL_NAME = "5.0.2.arch1-1-x86_64"

kernel_repository(KERNEL_NAME, KERNEL_SHA256)

kernel_driver("e1000", "net/ethernet/intel/e1000", KERNEL_NAME, KERNEL_SHA256)

http_archive(
    name = "syslinux",
    build_file_content = """ 
filegroup(
	name = "isolinux",
	srcs = [
		":bios/core/isolinux.bin",
		":bios/com32/elflink/ldlinux/ldlinux.c32",
	],
        visibility = ["//visibility:public"],
)
    """,
    sha256 = "26d3986d2bea109d5dc0e4f8c4822a459276cf021125e8c9f23c3cca5d8c850e",
    strip_prefix = "syslinux-6.03",
    url = "http://kernel.org/pub/linux/utils/boot/syslinux/syslinux-6.03.tar.xz",
)

# Rust stuff
http_archive(
    name = "io_bazel_rules_rust",
    sha256 = "c82118824b2448b77146f1dae97b6eaa717babedad0822aca4879f3cbbf2b7b5",
    strip_prefix = "rules_rust-3228ccd3814c2ad0d7307d2f87fb8ff9616149d7",
    urls = [
        # Master branch as of 2018-12-11
        "https://github.com/bazelbuild/rules_rust/archive/3228ccd3814c2ad0d7307d2f87fb8ff9616149d7.tar.gz",
    ],
)

http_archive(
    name = "bazel_skylib",
    sha256 = "eb5c57e4c12e68c0c20bc774bfbc60a568e800d025557bc4ea022c6479acc867",
    strip_prefix = "bazel-skylib-0.6.0",
    url = "https://github.com/bazelbuild/bazel-skylib/archive/0.6.0.tar.gz",
)

load("@io_bazel_rules_rust//rust:repositories.bzl", "rust_repository_set")

rust_repository_set(
    name = "rust_linux_x86_64",
    exec_triple = "x86_64-unknown-linux-gnu",
    extra_target_triples = [],
    version = "1.33.0",
)

load("@io_bazel_rules_rust//:workspace.bzl", "bazel_version")

bazel_version(name = "bazel_version")

load("//application/raze:crates.bzl", fetch_application_crates = "raze_fetch_remote_crates")

fetch_application_crates()

load("//mkrootfs/raze:crates.bzl", fetch_mkrootfs_crates = "raze_fetch_remote_crates")

fetch_mkrootfs_crates()

http_archive(
    name = "pycdlib",
    build_file_content = """ 
py_library(
	name = "pycdlib",
	srcs = glob(["*.py"]),
	visibility = ["//visibility:public"],
)
    """,
    sha256 = "8a1669c8e932412b4572f5331d31f8ec2e70b63478eee50bae6448ec096acf6b",
    strip_prefix = "pycdlib-1.7.0/pycdlib/",
    url = "https://github.com/clalancette/pycdlib/archive/v1.7.0.tar.gz",
)

http_file(
    name = "rust-std-1.33.0-x86_64-unknown-linux-musl",
    sha256 = "c3c0bf38140f7108705bbeeeaebd3dd9e23f556d36796779100c8ecf9142da7f",
    urls = ["https://static.rust-lang.org/dist/rust-std-1.33.0-x86_64-unknown-linux-musl.tar.gz"],
)

http_file(
    name = "rustc-1.33.0-x86_64-unknown-linux-gnu",
    sha256 = "54a342f718b712d8a17fd7878ebd37d22a82ebc70b59c421168cd4153fd04c2b",
    urls = ["https://static.rust-lang.org/dist/rustc-1.33.0-x86_64-unknown-linux-gnu.tar.gz"],
)
