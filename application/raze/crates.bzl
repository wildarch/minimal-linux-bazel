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
        name = "raze__arrayvec__0_4_10",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/arrayvec/arrayvec-0.4.10.crate",
        type = "tar.gz",
        sha256 = "92c7fb76bc8826a8b33b4ee5bb07a247a81e76764ab4d55e8f73e3a4d8808c71",
        strip_prefix = "arrayvec-0.4.10",
        build_file = Label("//raze/remote:arrayvec-0.4.10.BUILD")
    )

    _new_http_archive(
        name = "raze__autocfg__0_1_2",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/autocfg/autocfg-0.1.2.crate",
        type = "tar.gz",
        sha256 = "a6d640bee2da49f60a4068a7fae53acde8982514ab7bae8b8cea9e88cbcfd799",
        strip_prefix = "autocfg-0.1.2",
        build_file = Label("//raze/remote:autocfg-0.1.2.BUILD")
    )

    _new_http_archive(
        name = "raze__bitflags__1_0_4",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/bitflags/bitflags-1.0.4.crate",
        type = "tar.gz",
        sha256 = "228047a76f468627ca71776ecdebd732a3423081fcf5125585bcd7c49886ce12",
        strip_prefix = "bitflags-1.0.4",
        build_file = Label("//raze/remote:bitflags-1.0.4.BUILD")
    )

    _new_http_archive(
        name = "raze__byteorder__1_3_1",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/byteorder/byteorder-1.3.1.crate",
        type = "tar.gz",
        sha256 = "a019b10a2a7cdeb292db131fc8113e57ea2a908f6e7894b0c3c671893b65dbeb",
        strip_prefix = "byteorder-1.3.1",
        build_file = Label("//raze/remote:byteorder-1.3.1.BUILD")
    )

    _new_http_archive(
        name = "raze__bytes__0_4_12",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/bytes/bytes-0.4.12.crate",
        type = "tar.gz",
        sha256 = "206fdffcfa2df7cbe15601ef46c813fce0965eb3286db6b56c583b814b51c81c",
        strip_prefix = "bytes-0.4.12",
        build_file = Label("//raze/remote:bytes-0.4.12.BUILD")
    )

    _new_http_archive(
        name = "raze__cc__1_0_31",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/cc/cc-1.0.31.crate",
        type = "tar.gz",
        sha256 = "c9ce8bb087aacff865633f0bd5aeaed910fe2fe55b55f4739527f2e023a2e53d",
        strip_prefix = "cc-1.0.31",
        build_file = Label("//raze/remote:cc-1.0.31.BUILD")
    )

    _new_http_archive(
        name = "raze__cfg_if__0_1_7",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/cfg-if/cfg-if-0.1.7.crate",
        type = "tar.gz",
        sha256 = "11d43355396e872eefb45ce6342e4374ed7bc2b3a502d1b28e36d6e23c05d1f4",
        strip_prefix = "cfg-if-0.1.7",
        build_file = Label("//raze/remote:cfg-if-0.1.7.BUILD")
    )

    _new_http_archive(
        name = "raze__cloudabi__0_0_3",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/cloudabi/cloudabi-0.0.3.crate",
        type = "tar.gz",
        sha256 = "ddfc5b9aa5d4507acaf872de71051dfd0e309860e88966e1051e462a077aac4f",
        strip_prefix = "cloudabi-0.0.3",
        build_file = Label("//raze/remote:cloudabi-0.0.3.BUILD")
    )

    _new_http_archive(
        name = "raze__crossbeam_deque__0_7_1",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/crossbeam-deque/crossbeam-deque-0.7.1.crate",
        type = "tar.gz",
        sha256 = "b18cd2e169ad86297e6bc0ad9aa679aee9daa4f19e8163860faf7c164e4f5a71",
        strip_prefix = "crossbeam-deque-0.7.1",
        build_file = Label("//raze/remote:crossbeam-deque-0.7.1.BUILD")
    )

    _new_http_archive(
        name = "raze__crossbeam_epoch__0_7_1",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/crossbeam-epoch/crossbeam-epoch-0.7.1.crate",
        type = "tar.gz",
        sha256 = "04c9e3102cc2d69cd681412141b390abd55a362afc1540965dad0ad4d34280b4",
        strip_prefix = "crossbeam-epoch-0.7.1",
        build_file = Label("//raze/remote:crossbeam-epoch-0.7.1.BUILD")
    )

    _new_http_archive(
        name = "raze__crossbeam_queue__0_1_2",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/crossbeam-queue/crossbeam-queue-0.1.2.crate",
        type = "tar.gz",
        sha256 = "7c979cd6cfe72335896575c6b5688da489e420d36a27a0b9eb0c73db574b4a4b",
        strip_prefix = "crossbeam-queue-0.1.2",
        build_file = Label("//raze/remote:crossbeam-queue-0.1.2.BUILD")
    )

    _new_http_archive(
        name = "raze__crossbeam_utils__0_6_5",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/crossbeam-utils/crossbeam-utils-0.6.5.crate",
        type = "tar.gz",
        sha256 = "f8306fcef4a7b563b76b7dd949ca48f52bc1141aa067d2ea09565f3e2652aa5c",
        strip_prefix = "crossbeam-utils-0.6.5",
        build_file = Label("//raze/remote:crossbeam-utils-0.6.5.BUILD")
    )

    _new_http_archive(
        name = "raze__errno__0_2_4",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/errno/errno-0.2.4.crate",
        type = "tar.gz",
        sha256 = "c2a071601ed01b988f896ab14b95e67335d1eeb50190932a1320f7fe3cadc84e",
        strip_prefix = "errno-0.2.4",
        build_file = Label("//raze/remote:errno-0.2.4.BUILD")
    )

    _new_http_archive(
        name = "raze__errno_dragonfly__0_1_1",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/errno-dragonfly/errno-dragonfly-0.1.1.crate",
        type = "tar.gz",
        sha256 = "14ca354e36190500e1e1fb267c647932382b54053c50b14970856c0b00a35067",
        strip_prefix = "errno-dragonfly-0.1.1",
        build_file = Label("//raze/remote:errno-dragonfly-0.1.1.BUILD")
    )

    _new_http_archive(
        name = "raze__fnv__1_0_6",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/fnv/fnv-1.0.6.crate",
        type = "tar.gz",
        sha256 = "2fad85553e09a6f881f739c29f0b00b0f01357c743266d478b68951ce23285f3",
        strip_prefix = "fnv-1.0.6",
        build_file = Label("//raze/remote:fnv-1.0.6.BUILD")
    )

    _new_http_archive(
        name = "raze__fuchsia_cprng__0_1_1",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/fuchsia-cprng/fuchsia-cprng-0.1.1.crate",
        type = "tar.gz",
        sha256 = "a06f77d526c1a601b7c4cdd98f54b5eaabffc14d5f2f0296febdc7f357c6d3ba",
        strip_prefix = "fuchsia-cprng-0.1.1",
        build_file = Label("//raze/remote:fuchsia-cprng-0.1.1.BUILD")
    )

    _new_http_archive(
        name = "raze__fuchsia_zircon__0_3_3",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/fuchsia-zircon/fuchsia-zircon-0.3.3.crate",
        type = "tar.gz",
        sha256 = "2e9763c69ebaae630ba35f74888db465e49e259ba1bc0eda7d06f4a067615d82",
        strip_prefix = "fuchsia-zircon-0.3.3",
        build_file = Label("//raze/remote:fuchsia-zircon-0.3.3.BUILD")
    )

    _new_http_archive(
        name = "raze__fuchsia_zircon_sys__0_3_3",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/fuchsia-zircon-sys/fuchsia-zircon-sys-0.3.3.crate",
        type = "tar.gz",
        sha256 = "3dcaa9ae7725d12cdb85b3ad99a434db70b468c09ded17e012d86b5c1010f7a7",
        strip_prefix = "fuchsia-zircon-sys-0.3.3",
        build_file = Label("//raze/remote:fuchsia-zircon-sys-0.3.3.BUILD")
    )

    _new_http_archive(
        name = "raze__futures__0_1_25",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/futures/futures-0.1.25.crate",
        type = "tar.gz",
        sha256 = "49e7653e374fe0d0c12de4250f0bdb60680b8c80eed558c5c7538eec9c89e21b",
        strip_prefix = "futures-0.1.25",
        build_file = Label("//raze/remote:futures-0.1.25.BUILD")
    )

    _new_http_archive(
        name = "raze__futures_cpupool__0_1_8",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/futures-cpupool/futures-cpupool-0.1.8.crate",
        type = "tar.gz",
        sha256 = "ab90cde24b3319636588d0c35fe03b1333857621051837ed769faefb4c2162e4",
        strip_prefix = "futures-cpupool-0.1.8",
        build_file = Label("//raze/remote:futures-cpupool-0.1.8.BUILD")
    )

    _new_http_archive(
        name = "raze__gcc__0_3_55",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/gcc/gcc-0.3.55.crate",
        type = "tar.gz",
        sha256 = "8f5f3913fa0bfe7ee1fd8248b6b9f42a5af4b9d65ec2dd2c3c26132b950ecfc2",
        strip_prefix = "gcc-0.3.55",
        build_file = Label("//raze/remote:gcc-0.3.55.BUILD")
    )

    _new_http_archive(
        name = "raze__h2__0_1_17",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/h2/h2-0.1.17.crate",
        type = "tar.gz",
        sha256 = "910a5e7be6283a9c91b3982fa5188368c8719cce2a3cf3b86048673bf9d9c36b",
        strip_prefix = "h2-0.1.17",
        build_file = Label("//raze/remote:h2-0.1.17.BUILD")
    )

    _new_http_archive(
        name = "raze__http__0_1_16",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/http/http-0.1.16.crate",
        type = "tar.gz",
        sha256 = "fe67e3678f2827030e89cc4b9e7ecd16d52f132c0b940ab5005f88e821500f6a",
        strip_prefix = "http-0.1.16",
        build_file = Label("//raze/remote:http-0.1.16.BUILD")
    )

    _new_http_archive(
        name = "raze__httparse__1_3_3",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/httparse/httparse-1.3.3.crate",
        type = "tar.gz",
        sha256 = "e8734b0cfd3bc3e101ec59100e101c2eecd19282202e87808b3037b442777a83",
        strip_prefix = "httparse-1.3.3",
        build_file = Label("//raze/remote:httparse-1.3.3.BUILD")
    )

    _new_http_archive(
        name = "raze__hyper__0_12_25",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/hyper/hyper-0.12.25.crate",
        type = "tar.gz",
        sha256 = "7d5b6658b016965ae301fa995306db965c93677880ea70765a84235a96eae896",
        strip_prefix = "hyper-0.12.25",
        build_file = Label("//raze/remote:hyper-0.12.25.BUILD")
    )

    _new_http_archive(
        name = "raze__indexmap__1_0_2",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/indexmap/indexmap-1.0.2.crate",
        type = "tar.gz",
        sha256 = "7e81a7c05f79578dbc15793d8b619db9ba32b4577003ef3af1a91c416798c58d",
        strip_prefix = "indexmap-1.0.2",
        build_file = Label("//raze/remote:indexmap-1.0.2.BUILD")
    )

    _new_http_archive(
        name = "raze__iovec__0_1_2",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/iovec/iovec-0.1.2.crate",
        type = "tar.gz",
        sha256 = "dbe6e417e7d0975db6512b90796e8ce223145ac4e33c377e4a42882a0e88bb08",
        strip_prefix = "iovec-0.1.2",
        build_file = Label("//raze/remote:iovec-0.1.2.BUILD")
    )

    _new_http_archive(
        name = "raze__itoa__0_4_3",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/itoa/itoa-0.4.3.crate",
        type = "tar.gz",
        sha256 = "1306f3464951f30e30d12373d31c79fbd52d236e5e896fd92f96ec7babbbe60b",
        strip_prefix = "itoa-0.4.3",
        build_file = Label("//raze/remote:itoa-0.4.3.BUILD")
    )

    _new_http_archive(
        name = "raze__kernel32_sys__0_2_2",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/kernel32-sys/kernel32-sys-0.2.2.crate",
        type = "tar.gz",
        sha256 = "7507624b29483431c0ba2d82aece8ca6cdba9382bff4ddd0f7490560c056098d",
        strip_prefix = "kernel32-sys-0.2.2",
        build_file = Label("//raze/remote:kernel32-sys-0.2.2.BUILD")
    )

    _new_http_archive(
        name = "raze__lazy_static__1_3_0",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/lazy_static/lazy_static-1.3.0.crate",
        type = "tar.gz",
        sha256 = "bc5729f27f159ddd61f4df6228e827e86643d4d3e7c32183cb30a1c08f604a14",
        strip_prefix = "lazy_static-1.3.0",
        build_file = Label("//raze/remote:lazy_static-1.3.0.BUILD")
    )

    _new_http_archive(
        name = "raze__lazycell__1_2_1",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/lazycell/lazycell-1.2.1.crate",
        type = "tar.gz",
        sha256 = "b294d6fa9ee409a054354afc4352b0b9ef7ca222c69b8812cbea9e7d2bf3783f",
        strip_prefix = "lazycell-1.2.1",
        build_file = Label("//raze/remote:lazycell-1.2.1.BUILD")
    )

    _new_http_archive(
        name = "raze__libc__0_2_50",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/libc/libc-0.2.50.crate",
        type = "tar.gz",
        sha256 = "aab692d7759f5cd8c859e169db98ae5b52c924add2af5fbbca11d12fefb567c1",
        strip_prefix = "libc-0.2.50",
        build_file = Label("//raze/remote:libc-0.2.50.BUILD")
    )

    _new_http_archive(
        name = "raze__lock_api__0_1_5",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/lock_api/lock_api-0.1.5.crate",
        type = "tar.gz",
        sha256 = "62ebf1391f6acad60e5c8b43706dde4582df75c06698ab44511d15016bc2442c",
        strip_prefix = "lock_api-0.1.5",
        build_file = Label("//raze/remote:lock_api-0.1.5.BUILD")
    )

    _new_http_archive(
        name = "raze__log__0_4_6",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/log/log-0.4.6.crate",
        type = "tar.gz",
        sha256 = "c84ec4b527950aa83a329754b01dbe3f58361d1c5efacd1f6d68c494d08a17c6",
        strip_prefix = "log-0.4.6",
        build_file = Label("//raze/remote:log-0.4.6.BUILD")
    )

    _new_http_archive(
        name = "raze__loopdev__0_2_1",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/loopdev/loopdev-0.2.1.crate",
        type = "tar.gz",
        sha256 = "ac9e35cfb6646d67059f2ca8913a90e6c60633053c103df423975297f33d6fcc",
        strip_prefix = "loopdev-0.2.1",
        build_file = Label("//raze/remote:loopdev-0.2.1.BUILD")
    )

    _new_http_archive(
        name = "raze__memoffset__0_2_1",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/memoffset/memoffset-0.2.1.crate",
        type = "tar.gz",
        sha256 = "0f9dc261e2b62d7a622bf416ea3c5245cdd5d9a7fcc428c0d06804dfce1775b3",
        strip_prefix = "memoffset-0.2.1",
        build_file = Label("//raze/remote:memoffset-0.2.1.BUILD")
    )

    _new_http_archive(
        name = "raze__mio__0_6_16",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/mio/mio-0.6.16.crate",
        type = "tar.gz",
        sha256 = "71646331f2619b1026cc302f87a2b8b648d5c6dd6937846a16cc8ce0f347f432",
        strip_prefix = "mio-0.6.16",
        build_file = Label("//raze/remote:mio-0.6.16.BUILD")
    )

    _new_http_archive(
        name = "raze__miow__0_2_1",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/miow/miow-0.2.1.crate",
        type = "tar.gz",
        sha256 = "8c1f2f3b1cf331de6896aabf6e9d55dca90356cc9960cca7eaaf408a355ae919",
        strip_prefix = "miow-0.2.1",
        build_file = Label("//raze/remote:miow-0.2.1.BUILD")
    )

    _new_http_archive(
        name = "raze__net2__0_2_33",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/net2/net2-0.2.33.crate",
        type = "tar.gz",
        sha256 = "42550d9fb7b6684a6d404d9fa7250c2eb2646df731d1c06afc06dcee9e1bcf88",
        strip_prefix = "net2-0.2.33",
        build_file = Label("//raze/remote:net2-0.2.33.BUILD")
    )

    _new_http_archive(
        name = "raze__nix__0_13_0",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/nix/nix-0.13.0.crate",
        type = "tar.gz",
        sha256 = "46f0f3210768d796e8fa79ec70ee6af172dacbe7147f5e69be5240a47778302b",
        strip_prefix = "nix-0.13.0",
        build_file = Label("//raze/remote:nix-0.13.0.BUILD")
    )

    _new_http_archive(
        name = "raze__nodrop__0_1_13",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/nodrop/nodrop-0.1.13.crate",
        type = "tar.gz",
        sha256 = "2f9667ddcc6cc8a43afc9b7917599d7216aa09c463919ea32c59ed6cac8bc945",
        strip_prefix = "nodrop-0.1.13",
        build_file = Label("//raze/remote:nodrop-0.1.13.BUILD")
    )

    _new_http_archive(
        name = "raze__num_cpus__1_10_0",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/num_cpus/num_cpus-1.10.0.crate",
        type = "tar.gz",
        sha256 = "1a23f0ed30a54abaa0c7e83b1d2d87ada7c3c23078d1d87815af3e3b6385fbba",
        strip_prefix = "num_cpus-1.10.0",
        build_file = Label("//raze/remote:num_cpus-1.10.0.BUILD")
    )

    _new_http_archive(
        name = "raze__owning_ref__0_4_0",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/owning_ref/owning_ref-0.4.0.crate",
        type = "tar.gz",
        sha256 = "49a4b8ea2179e6a2e27411d3bca09ca6dd630821cf6894c6c7c8467a8ee7ef13",
        strip_prefix = "owning_ref-0.4.0",
        build_file = Label("//raze/remote:owning_ref-0.4.0.BUILD")
    )

    _new_http_archive(
        name = "raze__parking_lot__0_7_1",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/parking_lot/parking_lot-0.7.1.crate",
        type = "tar.gz",
        sha256 = "ab41b4aed082705d1056416ae4468b6ea99d52599ecf3169b00088d43113e337",
        strip_prefix = "parking_lot-0.7.1",
        build_file = Label("//raze/remote:parking_lot-0.7.1.BUILD")
    )

    _new_http_archive(
        name = "raze__parking_lot_core__0_4_0",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/parking_lot_core/parking_lot_core-0.4.0.crate",
        type = "tar.gz",
        sha256 = "94c8c7923936b28d546dfd14d4472eaf34c99b14e1c973a32b3e6d4eb04298c9",
        strip_prefix = "parking_lot_core-0.4.0",
        build_file = Label("//raze/remote:parking_lot_core-0.4.0.BUILD")
    )

    _new_http_archive(
        name = "raze__rand__0_6_5",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/rand/rand-0.6.5.crate",
        type = "tar.gz",
        sha256 = "6d71dacdc3c88c1fde3885a3be3fbab9f35724e6ce99467f7d9c5026132184ca",
        strip_prefix = "rand-0.6.5",
        build_file = Label("//raze/remote:rand-0.6.5.BUILD")
    )

    _new_http_archive(
        name = "raze__rand_chacha__0_1_1",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/rand_chacha/rand_chacha-0.1.1.crate",
        type = "tar.gz",
        sha256 = "556d3a1ca6600bfcbab7c7c91ccb085ac7fbbcd70e008a98742e7847f4f7bcef",
        strip_prefix = "rand_chacha-0.1.1",
        build_file = Label("//raze/remote:rand_chacha-0.1.1.BUILD")
    )

    _new_http_archive(
        name = "raze__rand_core__0_3_1",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/rand_core/rand_core-0.3.1.crate",
        type = "tar.gz",
        sha256 = "7a6fdeb83b075e8266dcc8762c22776f6877a63111121f5f8c7411e5be7eed4b",
        strip_prefix = "rand_core-0.3.1",
        build_file = Label("//raze/remote:rand_core-0.3.1.BUILD")
    )

    _new_http_archive(
        name = "raze__rand_core__0_4_0",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/rand_core/rand_core-0.4.0.crate",
        type = "tar.gz",
        sha256 = "d0e7a549d590831370895ab7ba4ea0c1b6b011d106b5ff2da6eee112615e6dc0",
        strip_prefix = "rand_core-0.4.0",
        build_file = Label("//raze/remote:rand_core-0.4.0.BUILD")
    )

    _new_http_archive(
        name = "raze__rand_hc__0_1_0",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/rand_hc/rand_hc-0.1.0.crate",
        type = "tar.gz",
        sha256 = "7b40677c7be09ae76218dc623efbf7b18e34bced3f38883af07bb75630a21bc4",
        strip_prefix = "rand_hc-0.1.0",
        build_file = Label("//raze/remote:rand_hc-0.1.0.BUILD")
    )

    _new_http_archive(
        name = "raze__rand_isaac__0_1_1",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/rand_isaac/rand_isaac-0.1.1.crate",
        type = "tar.gz",
        sha256 = "ded997c9d5f13925be2a6fd7e66bf1872597f759fd9dd93513dd7e92e5a5ee08",
        strip_prefix = "rand_isaac-0.1.1",
        build_file = Label("//raze/remote:rand_isaac-0.1.1.BUILD")
    )

    _new_http_archive(
        name = "raze__rand_jitter__0_1_3",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/rand_jitter/rand_jitter-0.1.3.crate",
        type = "tar.gz",
        sha256 = "7b9ea758282efe12823e0d952ddb269d2e1897227e464919a554f2a03ef1b832",
        strip_prefix = "rand_jitter-0.1.3",
        build_file = Label("//raze/remote:rand_jitter-0.1.3.BUILD")
    )

    _new_http_archive(
        name = "raze__rand_os__0_1_3",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/rand_os/rand_os-0.1.3.crate",
        type = "tar.gz",
        sha256 = "7b75f676a1e053fc562eafbb47838d67c84801e38fc1ba459e8f180deabd5071",
        strip_prefix = "rand_os-0.1.3",
        build_file = Label("//raze/remote:rand_os-0.1.3.BUILD")
    )

    _new_http_archive(
        name = "raze__rand_pcg__0_1_2",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/rand_pcg/rand_pcg-0.1.2.crate",
        type = "tar.gz",
        sha256 = "abf9b09b01790cfe0364f52bf32995ea3c39f4d2dd011eac241d2914146d0b44",
        strip_prefix = "rand_pcg-0.1.2",
        build_file = Label("//raze/remote:rand_pcg-0.1.2.BUILD")
    )

    _new_http_archive(
        name = "raze__rand_xorshift__0_1_1",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/rand_xorshift/rand_xorshift-0.1.1.crate",
        type = "tar.gz",
        sha256 = "cbf7e9e623549b0e21f6e97cf8ecf247c1a8fd2e8a992ae265314300b2455d5c",
        strip_prefix = "rand_xorshift-0.1.1",
        build_file = Label("//raze/remote:rand_xorshift-0.1.1.BUILD")
    )

    _new_http_archive(
        name = "raze__rdrand__0_4_0",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/rdrand/rdrand-0.4.0.crate",
        type = "tar.gz",
        sha256 = "678054eb77286b51581ba43620cc911abf02758c91f93f479767aed0f90458b2",
        strip_prefix = "rdrand-0.4.0",
        build_file = Label("//raze/remote:rdrand-0.4.0.BUILD")
    )

    _new_http_archive(
        name = "raze__redox_syscall__0_1_51",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/redox_syscall/redox_syscall-0.1.51.crate",
        type = "tar.gz",
        sha256 = "423e376fffca3dfa06c9e9790a9ccd282fafb3cc6e6397d01dbf64f9bacc6b85",
        strip_prefix = "redox_syscall-0.1.51",
        build_file = Label("//raze/remote:redox_syscall-0.1.51.BUILD")
    )

    _new_http_archive(
        name = "raze__rustc_version__0_2_3",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/rustc_version/rustc_version-0.2.3.crate",
        type = "tar.gz",
        sha256 = "138e3e0acb6c9fb258b19b67cb8abd63c00679d2851805ea151465464fe9030a",
        strip_prefix = "rustc_version-0.2.3",
        build_file = Label("//raze/remote:rustc_version-0.2.3.BUILD")
    )

    _new_http_archive(
        name = "raze__scopeguard__0_3_3",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/scopeguard/scopeguard-0.3.3.crate",
        type = "tar.gz",
        sha256 = "94258f53601af11e6a49f722422f6e3425c52b06245a5cf9bc09908b174f5e27",
        strip_prefix = "scopeguard-0.3.3",
        build_file = Label("//raze/remote:scopeguard-0.3.3.BUILD")
    )

    _new_http_archive(
        name = "raze__semver__0_9_0",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/semver/semver-0.9.0.crate",
        type = "tar.gz",
        sha256 = "1d7eb9ef2c18661902cc47e535f9bc51b78acd254da71d375c2f6720d9a40403",
        strip_prefix = "semver-0.9.0",
        build_file = Label("//raze/remote:semver-0.9.0.BUILD")
    )

    _new_http_archive(
        name = "raze__semver_parser__0_7_0",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/semver-parser/semver-parser-0.7.0.crate",
        type = "tar.gz",
        sha256 = "388a1df253eca08550bef6c72392cfe7c30914bf41df5269b68cbd6ff8f570a3",
        strip_prefix = "semver-parser-0.7.0",
        build_file = Label("//raze/remote:semver-parser-0.7.0.BUILD")
    )

    _new_http_archive(
        name = "raze__slab__0_4_2",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/slab/slab-0.4.2.crate",
        type = "tar.gz",
        sha256 = "c111b5bd5695e56cffe5129854aa230b39c93a305372fdbb2668ca2394eea9f8",
        strip_prefix = "slab-0.4.2",
        build_file = Label("//raze/remote:slab-0.4.2.BUILD")
    )

    _new_http_archive(
        name = "raze__smallvec__0_6_9",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/smallvec/smallvec-0.6.9.crate",
        type = "tar.gz",
        sha256 = "c4488ae950c49d403731982257768f48fada354a5203fe81f9bb6f43ca9002be",
        strip_prefix = "smallvec-0.6.9",
        build_file = Label("//raze/remote:smallvec-0.6.9.BUILD")
    )

    _new_http_archive(
        name = "raze__stable_deref_trait__1_1_1",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/stable_deref_trait/stable_deref_trait-1.1.1.crate",
        type = "tar.gz",
        sha256 = "dba1a27d3efae4351c8051072d619e3ade2820635c3958d826bfea39d59b54c8",
        strip_prefix = "stable_deref_trait-1.1.1",
        build_file = Label("//raze/remote:stable_deref_trait-1.1.1.BUILD")
    )

    _new_http_archive(
        name = "raze__string__0_1_3",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/string/string-0.1.3.crate",
        type = "tar.gz",
        sha256 = "b639411d0b9c738748b5397d5ceba08e648f4f1992231aa859af1a017f31f60b",
        strip_prefix = "string-0.1.3",
        build_file = Label("//raze/remote:string-0.1.3.BUILD")
    )

    _new_http_archive(
        name = "raze__sys_mount__1_2_0",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/sys-mount/sys-mount-1.2.0.crate",
        type = "tar.gz",
        sha256 = "574db4a99f40b407e9a3f7c5bcc96ad160ef07c5b8daab9cbb22315d86760280",
        strip_prefix = "sys-mount-1.2.0",
        build_file = Label("//raze/remote:sys-mount-1.2.0.BUILD")
    )

    _new_http_archive(
        name = "raze__time__0_1_42",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/time/time-0.1.42.crate",
        type = "tar.gz",
        sha256 = "db8dcfca086c1143c9270ac42a2bbd8a7ee477b78ac8e45b19abfb0cbede4b6f",
        strip_prefix = "time-0.1.42",
        build_file = Label("//raze/remote:time-0.1.42.BUILD")
    )

    _new_http_archive(
        name = "raze__tokio__0_1_17",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/tokio/tokio-0.1.17.crate",
        type = "tar.gz",
        sha256 = "1021bb1f4150435ab8f222eb7ed37c60b2d57037def63ba43085a79f387512d7",
        strip_prefix = "tokio-0.1.17",
        build_file = Label("//raze/remote:tokio-0.1.17.BUILD")
    )

    _new_http_archive(
        name = "raze__tokio_current_thread__0_1_5",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/tokio-current-thread/tokio-current-thread-0.1.5.crate",
        type = "tar.gz",
        sha256 = "c756b04680eea21902a46fca4e9f410a2332c04995af590e07ff262e2193a9a3",
        strip_prefix = "tokio-current-thread-0.1.5",
        build_file = Label("//raze/remote:tokio-current-thread-0.1.5.BUILD")
    )

    _new_http_archive(
        name = "raze__tokio_executor__0_1_6",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/tokio-executor/tokio-executor-0.1.6.crate",
        type = "tar.gz",
        sha256 = "30c6dbf2d1ad1de300b393910e8a3aa272b724a400b6531da03eed99e329fbf0",
        strip_prefix = "tokio-executor-0.1.6",
        build_file = Label("//raze/remote:tokio-executor-0.1.6.BUILD")
    )

    _new_http_archive(
        name = "raze__tokio_io__0_1_12",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/tokio-io/tokio-io-0.1.12.crate",
        type = "tar.gz",
        sha256 = "5090db468dad16e1a7a54c8c67280c5e4b544f3d3e018f0b913b400261f85926",
        strip_prefix = "tokio-io-0.1.12",
        build_file = Label("//raze/remote:tokio-io-0.1.12.BUILD")
    )

    _new_http_archive(
        name = "raze__tokio_reactor__0_1_9",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/tokio-reactor/tokio-reactor-0.1.9.crate",
        type = "tar.gz",
        sha256 = "6af16bfac7e112bea8b0442542161bfc41cbfa4466b580bdda7d18cb88b911ce",
        strip_prefix = "tokio-reactor-0.1.9",
        build_file = Label("//raze/remote:tokio-reactor-0.1.9.BUILD")
    )

    _new_http_archive(
        name = "raze__tokio_sync__0_1_4",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/tokio-sync/tokio-sync-0.1.4.crate",
        type = "tar.gz",
        sha256 = "fda385df506bf7546e70872767f71e81640f1f251bdf2fd8eb81a0eaec5fe022",
        strip_prefix = "tokio-sync-0.1.4",
        build_file = Label("//raze/remote:tokio-sync-0.1.4.BUILD")
    )

    _new_http_archive(
        name = "raze__tokio_tcp__0_1_3",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/tokio-tcp/tokio-tcp-0.1.3.crate",
        type = "tar.gz",
        sha256 = "1d14b10654be682ac43efee27401d792507e30fd8d26389e1da3b185de2e4119",
        strip_prefix = "tokio-tcp-0.1.3",
        build_file = Label("//raze/remote:tokio-tcp-0.1.3.BUILD")
    )

    _new_http_archive(
        name = "raze__tokio_threadpool__0_1_12",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/tokio-threadpool/tokio-threadpool-0.1.12.crate",
        type = "tar.gz",
        sha256 = "742e511f6ce2298aeb86fc9ea0d8df81c2388c6ebae3dc8a7316e8c9df0df801",
        strip_prefix = "tokio-threadpool-0.1.12",
        build_file = Label("//raze/remote:tokio-threadpool-0.1.12.BUILD")
    )

    _new_http_archive(
        name = "raze__tokio_timer__0_2_10",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/tokio-timer/tokio-timer-0.2.10.crate",
        type = "tar.gz",
        sha256 = "2910970404ba6fa78c5539126a9ae2045d62e3713041e447f695f41405a120c6",
        strip_prefix = "tokio-timer-0.2.10",
        build_file = Label("//raze/remote:tokio-timer-0.2.10.BUILD")
    )

    _new_http_archive(
        name = "raze__tokio_trace_core__0_1_0",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/tokio-trace-core/tokio-trace-core-0.1.0.crate",
        type = "tar.gz",
        sha256 = "350c9edade9830dc185ae48ba45667a445ab59f6167ef6d0254ec9d2430d9dd3",
        strip_prefix = "tokio-trace-core-0.1.0",
        build_file = Label("//raze/remote:tokio-trace-core-0.1.0.BUILD")
    )

    _new_http_archive(
        name = "raze__try_lock__0_2_2",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/try-lock/try-lock-0.2.2.crate",
        type = "tar.gz",
        sha256 = "e604eb7b43c06650e854be16a2a03155743d3752dd1c943f6829e26b7a36e382",
        strip_prefix = "try-lock-0.2.2",
        build_file = Label("//raze/remote:try-lock-0.2.2.BUILD")
    )

    _new_http_archive(
        name = "raze__void__1_0_2",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/void/void-1.0.2.crate",
        type = "tar.gz",
        sha256 = "6a02e4885ed3bc0f2de90ea6dd45ebcbb66dacffe03547fadbb0eeae2770887d",
        strip_prefix = "void-1.0.2",
        build_file = Label("//raze/remote:void-1.0.2.BUILD")
    )

    _new_http_archive(
        name = "raze__want__0_0_6",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/want/want-0.0.6.crate",
        type = "tar.gz",
        sha256 = "797464475f30ddb8830cc529aaaae648d581f99e2036a928877dfde027ddf6b3",
        strip_prefix = "want-0.0.6",
        build_file = Label("//raze/remote:want-0.0.6.BUILD")
    )

    _new_http_archive(
        name = "raze__winapi__0_2_8",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/winapi/winapi-0.2.8.crate",
        type = "tar.gz",
        sha256 = "167dc9d6949a9b857f3451275e911c3f44255842c1f7a76f33c55103a909087a",
        strip_prefix = "winapi-0.2.8",
        build_file = Label("//raze/remote:winapi-0.2.8.BUILD")
    )

    _new_http_archive(
        name = "raze__winapi__0_3_6",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/winapi/winapi-0.3.6.crate",
        type = "tar.gz",
        sha256 = "92c1eb33641e276cfa214a0522acad57be5c56b10cb348b3c5117db75f3ac4b0",
        strip_prefix = "winapi-0.3.6",
        build_file = Label("//raze/remote:winapi-0.3.6.BUILD")
    )

    _new_http_archive(
        name = "raze__winapi_build__0_1_1",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/winapi-build/winapi-build-0.1.1.crate",
        type = "tar.gz",
        sha256 = "2d315eee3b34aca4797b2da6b13ed88266e6d612562a0c46390af8299fc699bc",
        strip_prefix = "winapi-build-0.1.1",
        build_file = Label("//raze/remote:winapi-build-0.1.1.BUILD")
    )

    _new_http_archive(
        name = "raze__winapi_i686_pc_windows_gnu__0_4_0",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/winapi-i686-pc-windows-gnu/winapi-i686-pc-windows-gnu-0.4.0.crate",
        type = "tar.gz",
        sha256 = "ac3b87c63620426dd9b991e5ce0329eff545bccbbb34f3be09ff6fb6ab51b7b6",
        strip_prefix = "winapi-i686-pc-windows-gnu-0.4.0",
        build_file = Label("//raze/remote:winapi-i686-pc-windows-gnu-0.4.0.BUILD")
    )

    _new_http_archive(
        name = "raze__winapi_x86_64_pc_windows_gnu__0_4_0",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/winapi-x86_64-pc-windows-gnu/winapi-x86_64-pc-windows-gnu-0.4.0.crate",
        type = "tar.gz",
        sha256 = "712e227841d057c1ee1cd2fb22fa7e5a5461ae8e48fa2ca79ec42cfc1931183f",
        strip_prefix = "winapi-x86_64-pc-windows-gnu-0.4.0",
        build_file = Label("//raze/remote:winapi-x86_64-pc-windows-gnu-0.4.0.BUILD")
    )

    _new_http_archive(
        name = "raze__ws2_32_sys__0_2_1",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/ws2_32-sys/ws2_32-sys-0.2.1.crate",
        type = "tar.gz",
        sha256 = "d59cefebd0c892fa2dd6de581e937301d8552cb44489cdff035c6187cb63fa5e",
        strip_prefix = "ws2_32-sys-0.2.1",
        build_file = Label("//raze/remote:ws2_32-sys-0.2.1.BUILD")
    )

