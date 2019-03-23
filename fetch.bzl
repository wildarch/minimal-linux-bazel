load("@minimal_linux_bazel//:isolinux.bzl", "fetch_isolinux")
load("@minimal_linux_bazel//mkrootfs/raze:crates.bzl", fetch_mkrootfs_crates = "raze_fetch_remote_crates")
load("@minimal_linux_bazel//mkiso:packages.bzl", fetch_mkiso_packages = "fetch_packages")
load("@minimal_linux_bazel//toolchain:fetch.bzl", "fetch_toolchains")

def fetch_dependencies():
    fetch_isolinux()
    fetch_mkrootfs_crates()
    fetch_mkiso_packages()
    fetch_toolchains()
