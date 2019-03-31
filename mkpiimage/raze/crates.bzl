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
        name = "raze__ansi_term__0_11_0",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/ansi_term/ansi_term-0.11.0.crate",
        type = "tar.gz",
        sha256 = "ee49baf6cb617b853aa8d93bf420db2383fab46d314482ca2803b40d5fde979b",
        strip_prefix = "ansi_term-0.11.0",
        build_file = Label("//mkpiimage/raze/remote:ansi_term-0.11.0.BUILD")
    )

    _new_http_archive(
        name = "raze__atty__0_2_11",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/atty/atty-0.2.11.crate",
        type = "tar.gz",
        sha256 = "9a7d5b8723950951411ee34d271d99dddcc2035a16ab25310ea2c8cfd4369652",
        strip_prefix = "atty-0.2.11",
        build_file = Label("//mkpiimage/raze/remote:atty-0.2.11.BUILD")
    )

    _new_http_archive(
        name = "raze__bitflags__1_0_4",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/bitflags/bitflags-1.0.4.crate",
        type = "tar.gz",
        sha256 = "228047a76f468627ca71776ecdebd732a3423081fcf5125585bcd7c49886ce12",
        strip_prefix = "bitflags-1.0.4",
        build_file = Label("//mkpiimage/raze/remote:bitflags-1.0.4.BUILD")
    )

    _new_http_archive(
        name = "raze__byteorder__1_3_1",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/byteorder/byteorder-1.3.1.crate",
        type = "tar.gz",
        sha256 = "a019b10a2a7cdeb292db131fc8113e57ea2a908f6e7894b0c3c671893b65dbeb",
        strip_prefix = "byteorder-1.3.1",
        build_file = Label("//mkpiimage/raze/remote:byteorder-1.3.1.BUILD")
    )

    _new_http_archive(
        name = "raze__cfg_if__0_1_7",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/cfg-if/cfg-if-0.1.7.crate",
        type = "tar.gz",
        sha256 = "11d43355396e872eefb45ce6342e4374ed7bc2b3a502d1b28e36d6e23c05d1f4",
        strip_prefix = "cfg-if-0.1.7",
        build_file = Label("//mkpiimage/raze/remote:cfg-if-0.1.7.BUILD")
    )

    _new_http_archive(
        name = "raze__chrono__0_4_6",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/chrono/chrono-0.4.6.crate",
        type = "tar.gz",
        sha256 = "45912881121cb26fad7c38c17ba7daa18764771836b34fab7d3fbd93ed633878",
        strip_prefix = "chrono-0.4.6",
        build_file = Label("//mkpiimage/raze/remote:chrono-0.4.6.BUILD")
    )

    _new_http_archive(
        name = "raze__clap__2_32_0",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/clap/clap-2.32.0.crate",
        type = "tar.gz",
        sha256 = "b957d88f4b6a63b9d70d5f454ac8011819c6efa7727858f458ab71c756ce2d3e",
        strip_prefix = "clap-2.32.0",
        build_file = Label("//mkpiimage/raze/remote:clap-2.32.0.BUILD")
    )

    _new_http_archive(
        name = "raze__fatfs__0_3_2",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/fatfs/fatfs-0.3.2.crate",
        type = "tar.gz",
        sha256 = "8edc0ec6d85ff0f9a0f1049957803bfc13d7397b4ddc2ed3df50599d142ac858",
        strip_prefix = "fatfs-0.3.2",
        build_file = Label("//mkpiimage/raze/remote:fatfs-0.3.2.BUILD")
    )

    _new_http_archive(
        name = "raze__fscommon__0_1_0",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/fscommon/fscommon-0.1.0.crate",
        type = "tar.gz",
        sha256 = "a84b4c932d50705767a650d5933446acd532e6c2bdb00179c2f145018612368f",
        strip_prefix = "fscommon-0.1.0",
        build_file = Label("//mkpiimage/raze/remote:fscommon-0.1.0.BUILD")
    )

    _new_http_archive(
        name = "raze__heck__0_3_1",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/heck/heck-0.3.1.crate",
        type = "tar.gz",
        sha256 = "20564e78d53d2bb135c343b3f47714a56af2061f1c928fdb541dc7b9fdd94205",
        strip_prefix = "heck-0.3.1",
        build_file = Label("//mkpiimage/raze/remote:heck-0.3.1.BUILD")
    )

    _new_http_archive(
        name = "raze__libc__0_2_51",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/libc/libc-0.2.51.crate",
        type = "tar.gz",
        sha256 = "bedcc7a809076656486ffe045abeeac163da1b558e963a31e29fbfbeba916917",
        strip_prefix = "libc-0.2.51",
        build_file = Label("//mkpiimage/raze/remote:libc-0.2.51.BUILD")
    )

    _new_http_archive(
        name = "raze__log__0_4_6",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/log/log-0.4.6.crate",
        type = "tar.gz",
        sha256 = "c84ec4b527950aa83a329754b01dbe3f58361d1c5efacd1f6d68c494d08a17c6",
        strip_prefix = "log-0.4.6",
        build_file = Label("//mkpiimage/raze/remote:log-0.4.6.BUILD")
    )

    _new_http_archive(
        name = "raze__num_integer__0_1_39",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/num-integer/num-integer-0.1.39.crate",
        type = "tar.gz",
        sha256 = "e83d528d2677f0518c570baf2b7abdcf0cd2d248860b68507bdcb3e91d4c0cea",
        strip_prefix = "num-integer-0.1.39",
        build_file = Label("//mkpiimage/raze/remote:num-integer-0.1.39.BUILD")
    )

    _new_http_archive(
        name = "raze__num_traits__0_2_6",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/num-traits/num-traits-0.2.6.crate",
        type = "tar.gz",
        sha256 = "0b3a5d7cc97d6d30d8b9bc8fa19bf45349ffe46241e8816f50f62f6d6aaabee1",
        strip_prefix = "num-traits-0.2.6",
        build_file = Label("//mkpiimage/raze/remote:num-traits-0.2.6.BUILD")
    )

    _new_http_archive(
        name = "raze__proc_macro2__0_4_27",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/proc-macro2/proc-macro2-0.4.27.crate",
        type = "tar.gz",
        sha256 = "4d317f9caece796be1980837fd5cb3dfec5613ebdb04ad0956deea83ce168915",
        strip_prefix = "proc-macro2-0.4.27",
        build_file = Label("//mkpiimage/raze/remote:proc-macro2-0.4.27.BUILD")
    )

    _new_http_archive(
        name = "raze__quote__0_6_11",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/quote/quote-0.6.11.crate",
        type = "tar.gz",
        sha256 = "cdd8e04bd9c52e0342b406469d494fcb033be4bdbe5c606016defbb1681411e1",
        strip_prefix = "quote-0.6.11",
        build_file = Label("//mkpiimage/raze/remote:quote-0.6.11.BUILD")
    )

    _new_http_archive(
        name = "raze__redox_syscall__0_1_51",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/redox_syscall/redox_syscall-0.1.51.crate",
        type = "tar.gz",
        sha256 = "423e376fffca3dfa06c9e9790a9ccd282fafb3cc6e6397d01dbf64f9bacc6b85",
        strip_prefix = "redox_syscall-0.1.51",
        build_file = Label("//mkpiimage/raze/remote:redox_syscall-0.1.51.BUILD")
    )

    _new_http_archive(
        name = "raze__redox_termios__0_1_1",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/redox_termios/redox_termios-0.1.1.crate",
        type = "tar.gz",
        sha256 = "7e891cfe48e9100a70a3b6eb652fef28920c117d366339687bd5576160db0f76",
        strip_prefix = "redox_termios-0.1.1",
        build_file = Label("//mkpiimage/raze/remote:redox_termios-0.1.1.BUILD")
    )

    _new_http_archive(
        name = "raze__strsim__0_7_0",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/strsim/strsim-0.7.0.crate",
        type = "tar.gz",
        sha256 = "bb4f380125926a99e52bc279241539c018323fab05ad6368b56f93d9369ff550",
        strip_prefix = "strsim-0.7.0",
        build_file = Label("//mkpiimage/raze/remote:strsim-0.7.0.BUILD")
    )

    _new_http_archive(
        name = "raze__structopt__0_2_15",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/structopt/structopt-0.2.15.crate",
        type = "tar.gz",
        sha256 = "3d0760c312538987d363c36c42339b55f5ee176ea8808bbe4543d484a291c8d1",
        strip_prefix = "structopt-0.2.15",
        build_file = Label("//mkpiimage/raze/remote:structopt-0.2.15.BUILD")
    )

    _new_http_archive(
        name = "raze__structopt_derive__0_2_15",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/structopt-derive/structopt-derive-0.2.15.crate",
        type = "tar.gz",
        sha256 = "528aeb7351d042e6ffbc2a6fb76a86f9b622fdf7c25932798e7a82cb03bc94c6",
        strip_prefix = "structopt-derive-0.2.15",
        build_file = Label("//mkpiimage/raze/remote:structopt-derive-0.2.15.BUILD")
    )

    _new_http_archive(
        name = "raze__syn__0_15_29",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/syn/syn-0.15.29.crate",
        type = "tar.gz",
        sha256 = "1825685f977249735d510a242a6727b46efe914bb67e38d30c071b1b72b1d5c2",
        strip_prefix = "syn-0.15.29",
        build_file = Label("//mkpiimage/raze/remote:syn-0.15.29.BUILD")
    )

    _new_http_archive(
        name = "raze__termion__1_5_1",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/termion/termion-1.5.1.crate",
        type = "tar.gz",
        sha256 = "689a3bdfaab439fd92bc87df5c4c78417d3cbe537487274e9b0b2dce76e92096",
        strip_prefix = "termion-1.5.1",
        build_file = Label("//mkpiimage/raze/remote:termion-1.5.1.BUILD")
    )

    _new_http_archive(
        name = "raze__textwrap__0_10_0",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/textwrap/textwrap-0.10.0.crate",
        type = "tar.gz",
        sha256 = "307686869c93e71f94da64286f9a9524c0f308a9e1c87a583de8e9c9039ad3f6",
        strip_prefix = "textwrap-0.10.0",
        build_file = Label("//mkpiimage/raze/remote:textwrap-0.10.0.BUILD")
    )

    _new_http_archive(
        name = "raze__time__0_1_42",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/time/time-0.1.42.crate",
        type = "tar.gz",
        sha256 = "db8dcfca086c1143c9270ac42a2bbd8a7ee477b78ac8e45b19abfb0cbede4b6f",
        strip_prefix = "time-0.1.42",
        build_file = Label("//mkpiimage/raze/remote:time-0.1.42.BUILD")
    )

    _new_http_archive(
        name = "raze__unicode_segmentation__1_2_1",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/unicode-segmentation/unicode-segmentation-1.2.1.crate",
        type = "tar.gz",
        sha256 = "aa6024fc12ddfd1c6dbc14a80fa2324d4568849869b779f6bd37e5e4c03344d1",
        strip_prefix = "unicode-segmentation-1.2.1",
        build_file = Label("//mkpiimage/raze/remote:unicode-segmentation-1.2.1.BUILD")
    )

    _new_http_archive(
        name = "raze__unicode_width__0_1_5",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/unicode-width/unicode-width-0.1.5.crate",
        type = "tar.gz",
        sha256 = "882386231c45df4700b275c7ff55b6f3698780a650026380e72dabe76fa46526",
        strip_prefix = "unicode-width-0.1.5",
        build_file = Label("//mkpiimage/raze/remote:unicode-width-0.1.5.BUILD")
    )

    _new_http_archive(
        name = "raze__unicode_xid__0_1_0",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/unicode-xid/unicode-xid-0.1.0.crate",
        type = "tar.gz",
        sha256 = "fc72304796d0818e357ead4e000d19c9c174ab23dc11093ac919054d20a6a7fc",
        strip_prefix = "unicode-xid-0.1.0",
        build_file = Label("//mkpiimage/raze/remote:unicode-xid-0.1.0.BUILD")
    )

    _new_http_archive(
        name = "raze__vec_map__0_8_1",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/vec_map/vec_map-0.8.1.crate",
        type = "tar.gz",
        sha256 = "05c78687fb1a80548ae3250346c3db86a80a7cdd77bda190189f2d0a0987c81a",
        strip_prefix = "vec_map-0.8.1",
        build_file = Label("//mkpiimage/raze/remote:vec_map-0.8.1.BUILD")
    )

    _new_http_archive(
        name = "raze__winapi__0_3_6",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/winapi/winapi-0.3.6.crate",
        type = "tar.gz",
        sha256 = "92c1eb33641e276cfa214a0522acad57be5c56b10cb348b3c5117db75f3ac4b0",
        strip_prefix = "winapi-0.3.6",
        build_file = Label("//mkpiimage/raze/remote:winapi-0.3.6.BUILD")
    )

    _new_http_archive(
        name = "raze__winapi_i686_pc_windows_gnu__0_4_0",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/winapi-i686-pc-windows-gnu/winapi-i686-pc-windows-gnu-0.4.0.crate",
        type = "tar.gz",
        sha256 = "ac3b87c63620426dd9b991e5ce0329eff545bccbbb34f3be09ff6fb6ab51b7b6",
        strip_prefix = "winapi-i686-pc-windows-gnu-0.4.0",
        build_file = Label("//mkpiimage/raze/remote:winapi-i686-pc-windows-gnu-0.4.0.BUILD")
    )

    _new_http_archive(
        name = "raze__winapi_x86_64_pc_windows_gnu__0_4_0",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/winapi-x86_64-pc-windows-gnu/winapi-x86_64-pc-windows-gnu-0.4.0.crate",
        type = "tar.gz",
        sha256 = "712e227841d057c1ee1cd2fb22fa7e5a5461ae8e48fa2ca79ec42cfc1931183f",
        strip_prefix = "winapi-x86_64-pc-windows-gnu-0.4.0",
        build_file = Label("//mkpiimage/raze/remote:winapi-x86_64-pc-windows-gnu-0.4.0.BUILD")
    )

