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
        name = "raze__libc__0_2_51",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/libc/libc-0.2.51.crate",
        type = "tar.gz",
        sha256 = "bedcc7a809076656486ffe045abeeac163da1b558e963a31e29fbfbeba916917",
        strip_prefix = "libc-0.2.51",
        build_file = Label("//raze/remote:libc-0.2.51.BUILD")
    )

    _new_http_archive(
        name = "raze__pkg_config__0_3_14",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/pkg-config/pkg-config-0.3.14.crate",
        type = "tar.gz",
        sha256 = "676e8eb2b1b4c9043511a9b7bea0915320d7e502b0a079fb03f9635a5252b18c",
        strip_prefix = "pkg-config-0.3.14",
        build_file = Label("//raze/remote:pkg-config-0.3.14.BUILD")
    )

    _new_http_archive(
        name = "raze__x11__2_18_1",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/x11/x11-2.18.1.crate",
        type = "tar.gz",
        sha256 = "39697e3123f715483d311b5826e254b6f3cfebdd83cf7ef3358f579c3d68e235",
        strip_prefix = "x11-2.18.1",
        build_file = Label("//raze/remote:x11-2.18.1.BUILD")
    )

