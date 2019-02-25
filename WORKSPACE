workspace(name = "minimal_linux_bazel")

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive", "http_file")

http_archive(
    name = "linux",
    build_file = "BUILD.linux",
    sha256 = "f0dada7d67f9e402d77852bca9a002aad0e7e1837279db92d897d8d4680b258d",
    strip_prefix = "boot/",
    url = "http://mirror.i3d.net/pub/archlinux/core/os/x86_64/linux-4.20.11.arch1-1-x86_64.pkg.tar.xz",
    # TODO mirrors
)

http_file(
    name = "busybox",
    downloaded_file_path = "busybox",
    executable = True,
    sha256 = "584e36c5ad6147863c6423fbd8180df0a77e3bdbd1f1b15a7fb393d1e17bee9e",
    urls = ["https://busybox.net/downloads/binaries/1.28.1-defconfig-multiarch/busybox-x86_64"],
)

http_archive(
    name = "syslinux",
    build_file = "BUILD.syslinux",
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

load("@io_bazel_rules_rust//rust:repositories.bzl", "rust_repositories")

rust_repositories()

load("@io_bazel_rules_rust//:workspace.bzl", "bazel_version")

bazel_version(name = "bazel_version")

http_archive(
    name = "cpio",
    build_file = "BUILD.cpio",
    sha256 = "f3750c713eca14655a2778c369edc4c1edf2386b5f3a5ca8f6745f9e08b2698d",
    strip_prefix = "cpio-rs-0.2.0",
    url = "https://github.com/jcreekmore/cpio-rs/archive/0.2.0.tar.gz",
)

http_archive(
    name = "libflate",
    build_file = "BUILD.libflate",
    sha256 = "b8957fd1a52633f7734767faf32d644305dacaa29f150ff4f7ced35d0bfc71fa",
    strip_prefix = "libflate-0.1.20",
    url = "https://github.com/sile/libflate/archive/0.1.20.tar.gz",
)

http_archive(
    name = "adler32",
    build_file = "BUILD.adler32",
    sha256 = "c7561840ce89f3b40fe9eaf50fccc7349342157dfd48ff933b61742b44fae187",
    strip_prefix = "adler32-rs-1.0.3",
    url = "https://github.com/remram44/adler32-rs/archive/1.0.3.tar.gz",
)

http_archive(
    name = "crc32fast",
    build_file = "BUILD.crc32fast",
    sha256 = "83508ba9326ebff94247096e445c412fe414220212b4857c71ad4f4605445fe7",
    strip_prefix = "rust-crc32fast-1.1.2",
    url = "https://github.com/srijs/rust-crc32fast/archive/v1.1.2.tar.gz",
)

http_archive(
    name = "cfg_if",
    build_file = "BUILD.cfg_if",
    sha256 = "0725ca36f2f3ae0180b24a34959aaed0e5422fe1f5ff505fdfb53ffee454db8a",
    strip_prefix = "cfg-if-0.1.6",
    url = "https://github.com/alexcrichton/cfg-if/archive/0.1.6.tar.gz",
)

http_archive(
    name = "byteorder",
    build_file = "BUILD.byteorder",
    sha256 = "f3bcf82fe684090e57291f20cc021914f275f49f1df14f80457022a6131b16cd",
    strip_prefix = "byteorder-1.3.1",
    url = "https://github.com/BurntSushi/byteorder/archive/1.3.1.tar.gz",
)
