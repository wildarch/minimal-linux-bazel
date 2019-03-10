"""
Functions for loading a linux kernel and associated modules.
"""

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive", "http_file")

KERNEL_URL = "https://archive.archlinux.org/packages/l/linux/linux-{}.pkg.tar.xz"

KERNEL_BUILD_FILE = """
alias(
    name = "kernel",
    actual = ":vmlinuz-linux",
    visibility = ["//visibility:public"],
)
"""

KERNEL_DRIVER_BUILD_FILE = """
alias(
    name = "{0}",
    actual = ":{0}.ko.xz",
    visibility = ["//visibility:public"],
)
"""

def kernel_url_to_path(url):
    parts = url.split(".")
    if len(parts) <= 2 or len(parts) > 4:
        fail("Invalid kernel name")
    elif len(parts) == 4:
        sub_parts = parts[3].split("-")
        sub_parts[-1] = "ARCH"
        joined = "-".join(sub_parts)
        return "{}.{}.{}-{}".format(parts[0], parts[1], parts[2], joined)
    else:
        # Fine as is
        return url

def kernel_repository(name, sha256):
    http_archive(
        name = "linux",
        build_file_content = KERNEL_BUILD_FILE,
        sha256 = sha256,
        strip_prefix = "boot/",
        url = KERNEL_URL.format(name),
    )

def kernel_driver(driver_name, path, kernel_name, kernel_sha256):
    http_archive(
        name = driver_name,
        build_file_content = KERNEL_DRIVER_BUILD_FILE.format(driver_name),
        sha256 = kernel_sha256,
        strip_prefix = "usr/lib/modules/" + kernel_url_to_path(kernel_name) + "/kernel/drivers/" + path,
        url = KERNEL_URL.format(kernel_name),
    )
