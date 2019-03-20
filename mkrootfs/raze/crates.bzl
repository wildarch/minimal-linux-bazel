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
        name = "raze__ansi_term__0_11_0",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/ansi_term/ansi_term-0.11.0.crate",
        type = "tar.gz",
        sha256 = "ee49baf6cb617b853aa8d93bf420db2383fab46d314482ca2803b40d5fde979b",
        strip_prefix = "ansi_term-0.11.0",
        build_file = Label("//mkrootfs/raze/remote:ansi_term-0.11.0.BUILD")
    )

    _new_http_archive(
        name = "raze__atty__0_2_11",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/atty/atty-0.2.11.crate",
        type = "tar.gz",
        sha256 = "9a7d5b8723950951411ee34d271d99dddcc2035a16ab25310ea2c8cfd4369652",
        strip_prefix = "atty-0.2.11",
        build_file = Label("//mkrootfs/raze/remote:atty-0.2.11.BUILD")
    )

    _new_http_archive(
        name = "raze__autocfg__0_1_2",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/autocfg/autocfg-0.1.2.crate",
        type = "tar.gz",
        sha256 = "a6d640bee2da49f60a4068a7fae53acde8982514ab7bae8b8cea9e88cbcfd799",
        strip_prefix = "autocfg-0.1.2",
        build_file = Label("//mkrootfs/raze/remote:autocfg-0.1.2.BUILD")
    )

    _new_http_archive(
        name = "raze__backtrace__0_3_14",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/backtrace/backtrace-0.3.14.crate",
        type = "tar.gz",
        sha256 = "cd5a90e2b463010cd0e0ce9a11d4a9d5d58d9f41d4a6ba3dcaf9e68b466e88b4",
        strip_prefix = "backtrace-0.3.14",
        build_file = Label("//mkrootfs/raze/remote:backtrace-0.3.14.BUILD")
    )

    _new_http_archive(
        name = "raze__backtrace_sys__0_1_28",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/backtrace-sys/backtrace-sys-0.1.28.crate",
        type = "tar.gz",
        sha256 = "797c830ac25ccc92a7f8a7b9862bde440715531514594a6154e3d4a54dd769b6",
        strip_prefix = "backtrace-sys-0.1.28",
        build_file = Label("//mkrootfs/raze/remote:backtrace-sys-0.1.28.BUILD")
    )

    _new_http_archive(
        name = "raze__bitflags__1_0_4",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/bitflags/bitflags-1.0.4.crate",
        type = "tar.gz",
        sha256 = "228047a76f468627ca71776ecdebd732a3423081fcf5125585bcd7c49886ce12",
        strip_prefix = "bitflags-1.0.4",
        build_file = Label("//mkrootfs/raze/remote:bitflags-1.0.4.BUILD")
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
        name = "raze__cc__1_0_31",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/cc/cc-1.0.31.crate",
        type = "tar.gz",
        sha256 = "c9ce8bb087aacff865633f0bd5aeaed910fe2fe55b55f4739527f2e023a2e53d",
        strip_prefix = "cc-1.0.31",
        build_file = Label("//mkrootfs/raze/remote:cc-1.0.31.BUILD")
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
        name = "raze__clap__2_32_0",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/clap/clap-2.32.0.crate",
        type = "tar.gz",
        sha256 = "b957d88f4b6a63b9d70d5f454ac8011819c6efa7727858f458ab71c756ce2d3e",
        strip_prefix = "clap-2.32.0",
        build_file = Label("//mkrootfs/raze/remote:clap-2.32.0.BUILD")
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
        name = "raze__failure__0_1_5",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/failure/failure-0.1.5.crate",
        type = "tar.gz",
        sha256 = "795bd83d3abeb9220f257e597aa0080a508b27533824adf336529648f6abf7e2",
        strip_prefix = "failure-0.1.5",
        build_file = Label("//mkrootfs/raze/remote:failure-0.1.5.BUILD")
    )

    _new_http_archive(
        name = "raze__failure_derive__0_1_5",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/failure_derive/failure_derive-0.1.5.crate",
        type = "tar.gz",
        sha256 = "ea1063915fd7ef4309e222a5a07cf9c319fb9c7836b1f89b85458672dbb127e1",
        strip_prefix = "failure_derive-0.1.5",
        build_file = Label("//mkrootfs/raze/remote:failure_derive-0.1.5.BUILD")
    )

    _new_http_archive(
        name = "raze__heck__0_3_1",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/heck/heck-0.3.1.crate",
        type = "tar.gz",
        sha256 = "20564e78d53d2bb135c343b3f47714a56af2061f1c928fdb541dc7b9fdd94205",
        strip_prefix = "heck-0.3.1",
        build_file = Label("//mkrootfs/raze/remote:heck-0.3.1.BUILD")
    )

    _new_http_archive(
        name = "raze__libc__0_2_50",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/libc/libc-0.2.50.crate",
        type = "tar.gz",
        sha256 = "aab692d7759f5cd8c859e169db98ae5b52c924add2af5fbbca11d12fefb567c1",
        strip_prefix = "libc-0.2.50",
        build_file = Label("//mkrootfs/raze/remote:libc-0.2.50.BUILD")
    )

    _new_http_archive(
        name = "raze__libflate__0_1_21",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/libflate/libflate-0.1.21.crate",
        type = "tar.gz",
        sha256 = "7346a83e8a2c3958d44d24225d905385dc31fc16e89dffb356c457b278914d20",
        strip_prefix = "libflate-0.1.21",
        build_file = Label("//mkrootfs/raze/remote:libflate-0.1.21.BUILD")
    )

    _new_http_archive(
        name = "raze__proc_macro2__0_4_27",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/proc-macro2/proc-macro2-0.4.27.crate",
        type = "tar.gz",
        sha256 = "4d317f9caece796be1980837fd5cb3dfec5613ebdb04ad0956deea83ce168915",
        strip_prefix = "proc-macro2-0.4.27",
        build_file = Label("//mkrootfs/raze/remote:proc-macro2-0.4.27.BUILD")
    )

    _new_http_archive(
        name = "raze__quote__0_6_11",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/quote/quote-0.6.11.crate",
        type = "tar.gz",
        sha256 = "cdd8e04bd9c52e0342b406469d494fcb033be4bdbe5c606016defbb1681411e1",
        strip_prefix = "quote-0.6.11",
        build_file = Label("//mkrootfs/raze/remote:quote-0.6.11.BUILD")
    )

    _new_http_archive(
        name = "raze__redox_syscall__0_1_51",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/redox_syscall/redox_syscall-0.1.51.crate",
        type = "tar.gz",
        sha256 = "423e376fffca3dfa06c9e9790a9ccd282fafb3cc6e6397d01dbf64f9bacc6b85",
        strip_prefix = "redox_syscall-0.1.51",
        build_file = Label("//mkrootfs/raze/remote:redox_syscall-0.1.51.BUILD")
    )

    _new_http_archive(
        name = "raze__redox_termios__0_1_1",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/redox_termios/redox_termios-0.1.1.crate",
        type = "tar.gz",
        sha256 = "7e891cfe48e9100a70a3b6eb652fef28920c117d366339687bd5576160db0f76",
        strip_prefix = "redox_termios-0.1.1",
        build_file = Label("//mkrootfs/raze/remote:redox_termios-0.1.1.BUILD")
    )

    _new_http_archive(
        name = "raze__rustc_demangle__0_1_13",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/rustc-demangle/rustc-demangle-0.1.13.crate",
        type = "tar.gz",
        sha256 = "adacaae16d02b6ec37fdc7acfcddf365978de76d1983d3ee22afc260e1ca9619",
        strip_prefix = "rustc-demangle-0.1.13",
        build_file = Label("//mkrootfs/raze/remote:rustc-demangle-0.1.13.BUILD")
    )

    _new_http_archive(
        name = "raze__strsim__0_7_0",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/strsim/strsim-0.7.0.crate",
        type = "tar.gz",
        sha256 = "bb4f380125926a99e52bc279241539c018323fab05ad6368b56f93d9369ff550",
        strip_prefix = "strsim-0.7.0",
        build_file = Label("//mkrootfs/raze/remote:strsim-0.7.0.BUILD")
    )

    _new_http_archive(
        name = "raze__structopt__0_2_15",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/structopt/structopt-0.2.15.crate",
        type = "tar.gz",
        sha256 = "3d0760c312538987d363c36c42339b55f5ee176ea8808bbe4543d484a291c8d1",
        strip_prefix = "structopt-0.2.15",
        build_file = Label("//mkrootfs/raze/remote:structopt-0.2.15.BUILD")
    )

    _new_http_archive(
        name = "raze__structopt_derive__0_2_15",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/structopt-derive/structopt-derive-0.2.15.crate",
        type = "tar.gz",
        sha256 = "528aeb7351d042e6ffbc2a6fb76a86f9b622fdf7c25932798e7a82cb03bc94c6",
        strip_prefix = "structopt-derive-0.2.15",
        build_file = Label("//mkrootfs/raze/remote:structopt-derive-0.2.15.BUILD")
    )

    _new_http_archive(
        name = "raze__syn__0_15_29",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/syn/syn-0.15.29.crate",
        type = "tar.gz",
        sha256 = "1825685f977249735d510a242a6727b46efe914bb67e38d30c071b1b72b1d5c2",
        strip_prefix = "syn-0.15.29",
        build_file = Label("//mkrootfs/raze/remote:syn-0.15.29.BUILD")
    )

    _new_http_archive(
        name = "raze__synstructure__0_10_1",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/synstructure/synstructure-0.10.1.crate",
        type = "tar.gz",
        sha256 = "73687139bf99285483c96ac0add482c3776528beac1d97d444f6e91f203a2015",
        strip_prefix = "synstructure-0.10.1",
        build_file = Label("//mkrootfs/raze/remote:synstructure-0.10.1.BUILD")
    )

    _new_http_archive(
        name = "raze__termion__1_5_1",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/termion/termion-1.5.1.crate",
        type = "tar.gz",
        sha256 = "689a3bdfaab439fd92bc87df5c4c78417d3cbe537487274e9b0b2dce76e92096",
        strip_prefix = "termion-1.5.1",
        build_file = Label("//mkrootfs/raze/remote:termion-1.5.1.BUILD")
    )

    _new_http_archive(
        name = "raze__textwrap__0_10_0",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/textwrap/textwrap-0.10.0.crate",
        type = "tar.gz",
        sha256 = "307686869c93e71f94da64286f9a9524c0f308a9e1c87a583de8e9c9039ad3f6",
        strip_prefix = "textwrap-0.10.0",
        build_file = Label("//mkrootfs/raze/remote:textwrap-0.10.0.BUILD")
    )

    _new_http_archive(
        name = "raze__unicode_segmentation__1_2_1",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/unicode-segmentation/unicode-segmentation-1.2.1.crate",
        type = "tar.gz",
        sha256 = "aa6024fc12ddfd1c6dbc14a80fa2324d4568849869b779f6bd37e5e4c03344d1",
        strip_prefix = "unicode-segmentation-1.2.1",
        build_file = Label("//mkrootfs/raze/remote:unicode-segmentation-1.2.1.BUILD")
    )

    _new_http_archive(
        name = "raze__unicode_width__0_1_5",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/unicode-width/unicode-width-0.1.5.crate",
        type = "tar.gz",
        sha256 = "882386231c45df4700b275c7ff55b6f3698780a650026380e72dabe76fa46526",
        strip_prefix = "unicode-width-0.1.5",
        build_file = Label("//mkrootfs/raze/remote:unicode-width-0.1.5.BUILD")
    )

    _new_http_archive(
        name = "raze__unicode_xid__0_1_0",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/unicode-xid/unicode-xid-0.1.0.crate",
        type = "tar.gz",
        sha256 = "fc72304796d0818e357ead4e000d19c9c174ab23dc11093ac919054d20a6a7fc",
        strip_prefix = "unicode-xid-0.1.0",
        build_file = Label("//mkrootfs/raze/remote:unicode-xid-0.1.0.BUILD")
    )

    _new_http_archive(
        name = "raze__vec_map__0_8_1",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/vec_map/vec_map-0.8.1.crate",
        type = "tar.gz",
        sha256 = "05c78687fb1a80548ae3250346c3db86a80a7cdd77bda190189f2d0a0987c81a",
        strip_prefix = "vec_map-0.8.1",
        build_file = Label("//mkrootfs/raze/remote:vec_map-0.8.1.BUILD")
    )

    _new_http_archive(
        name = "raze__winapi__0_3_6",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/winapi/winapi-0.3.6.crate",
        type = "tar.gz",
        sha256 = "92c1eb33641e276cfa214a0522acad57be5c56b10cb348b3c5117db75f3ac4b0",
        strip_prefix = "winapi-0.3.6",
        build_file = Label("//mkrootfs/raze/remote:winapi-0.3.6.BUILD")
    )

    _new_http_archive(
        name = "raze__winapi_i686_pc_windows_gnu__0_4_0",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/winapi-i686-pc-windows-gnu/winapi-i686-pc-windows-gnu-0.4.0.crate",
        type = "tar.gz",
        sha256 = "ac3b87c63620426dd9b991e5ce0329eff545bccbbb34f3be09ff6fb6ab51b7b6",
        strip_prefix = "winapi-i686-pc-windows-gnu-0.4.0",
        build_file = Label("//mkrootfs/raze/remote:winapi-i686-pc-windows-gnu-0.4.0.BUILD")
    )

    _new_http_archive(
        name = "raze__winapi_x86_64_pc_windows_gnu__0_4_0",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/winapi-x86_64-pc-windows-gnu/winapi-x86_64-pc-windows-gnu-0.4.0.crate",
        type = "tar.gz",
        sha256 = "712e227841d057c1ee1cd2fb22fa7e5a5461ae8e48fa2ca79ec42cfc1931183f",
        strip_prefix = "winapi-x86_64-pc-windows-gnu-0.4.0",
        build_file = Label("//mkrootfs/raze/remote:winapi-x86_64-pc-windows-gnu-0.4.0.BUILD")
    )

