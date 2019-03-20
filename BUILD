load("@io_bazel_rules_rust//rust:rust.bzl", "rust_binary")
load(":rootfs.bzl", "rust_rootfs")

rust_rootfs(
    name = "rootfs",
    out = "rootfs.gz",
    init = "//application",
)

genrule(
    name = "iso",
    srcs = [
        "//:isolinux.cfg",
        "@syslinux//:isolinux",
        "@linux//:kernel",
        ":rootfs",
    ],
    outs = ["dist.iso"],
    cmd = "mkdir root/ && \
		    cp -t root/ \
		    $(location //:isolinux.cfg) \
			$(locations @syslinux//:isolinux) \
			$(location @linux//:kernel) \
			$(location :rootfs) && \
            $(location //mkiso) \
			-o $@ \
			-b isolinux.bin \
			-c boot.cat \
			root/",
    tools = [
        "//mkiso",
    ],
)
