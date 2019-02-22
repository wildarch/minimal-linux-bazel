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
