load("//:isolinux.bzl", "fetch_isolinux")
load("//mkrootfs/raze:crates.bzl", fetch_mkrootfs_crates = "raze_fetch_remote_crates")
load("//mkiso:packages.bzl", fetch_mkiso_packages = "fetch_packages")
load("//toolchain:fetch.bzl", "fetch_musl_toolchain")

def fetch_dependencies():
    fetch_isolinux()
    fetch_mkrootfs_crates()
    fetch_mkiso_packages()
    fetch_musl_toolchain()
