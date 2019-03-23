load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def fetch_isolinux():
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
