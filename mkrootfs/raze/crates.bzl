"""
cargo-raze crate workspace functions

DO NOT EDIT! Replaced on runs of cargo-raze
"""
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:git.bzl", "new_git_repository")

def _new_http_archive(name, **kwargs):
    if not native.existing_rule(name):
        http_archive(name=name, **kwargs)

def _new_git_repository(name, **kwargs):
    if not native.existing_rule(name):
        new_git_repository(name=name, **kwargs)

def raze_fetch_remote_crates():

    _new_http_archive(
        name = "raze__adler32__1_0_3",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/adler32/adler32-1.0.3.crate",
        type = "tar.gz",
        sha256 = "7e522997b529f05601e05166c07ed17789691f562762c7f3b987263d2dedee5c",
        strip_prefix = "adler32-1.0.3",
        build_file = Label("//mkrootfs/raze/remote:adler32-1.0.3.BUILD")
    )

    _new_http_archive(
        name = "raze__byteorder__1_3_1",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/byteorder/byteorder-1.3.1.crate",
        type = "tar.gz",
        sha256 = "a019b10a2a7cdeb292db131fc8113e57ea2a908f6e7894b0c3c671893b65dbeb",
        strip_prefix = "byteorder-1.3.1",
        build_file = Label("//mkrootfs/raze/remote:byteorder-1.3.1.BUILD")
    )

    _new_http_archive(
        name = "raze__cfg_if__0_1_7",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/cfg-if/cfg-if-0.1.7.crate",
        type = "tar.gz",
        sha256 = "11d43355396e872eefb45ce6342e4374ed7bc2b3a502d1b28e36d6e23c05d1f4",
        strip_prefix = "cfg-if-0.1.7",
        build_file = Label("//mkrootfs/raze/remote:cfg-if-0.1.7.BUILD")
    )

    _new_http_archive(
        name = "raze__cpio__0_2_0",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/cpio/cpio-0.2.0.crate",
        type = "tar.gz",
        sha256 = "f00177cda1bb5c5b0a05b1b506125c776411cdfc6a41085126881266e0cdc242",
        strip_prefix = "cpio-0.2.0",
        build_file = Label("//mkrootfs/raze/remote:cpio-0.2.0.BUILD")
    )

    _new_http_archive(
        name = "raze__crc32fast__1_2_0",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/crc32fast/crc32fast-1.2.0.crate",
        type = "tar.gz",
        sha256 = "ba125de2af0df55319f41944744ad91c71113bf74a4646efff39afe1f6842db1",
        strip_prefix = "crc32fast-1.2.0",
        build_file = Label("//mkrootfs/raze/remote:crc32fast-1.2.0.BUILD")
    )

    _new_http_archive(
        name = "raze__libflate__0_1_21",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/libflate/libflate-0.1.21.crate",
        type = "tar.gz",
        sha256 = "7346a83e8a2c3958d44d24225d905385dc31fc16e89dffb356c457b278914d20",
        strip_prefix = "libflate-0.1.21",
        build_file = Label("//mkrootfs/raze/remote:libflate-0.1.21.BUILD")
    )

