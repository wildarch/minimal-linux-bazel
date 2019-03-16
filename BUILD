load("@io_bazel_rules_rust//rust:rust.bzl", "rust_binary")

rust_binary(
    name = "test_musl_bin",
    srcs = ["test_musl_bin.rs"],
)

genrule(
    name = "rootfs",
    srcs = [
        "@busybox//file",
        ":init",
        "@e1000//:e1000.ko",
        "//rust_hello",
    ],
    outs = ["rootfs.gz"],
    cmd = "mkdir rootfs/ && \
	(echo $(SRCS) | xargs cp -t rootfs/) && \
	chmod +x rootfs/init && \
	chmod +x rootfs/busybox && \
	mkdir rootfs/dev && \
	mkdir rootfs/proc && \
	mkdir rootfs/sys && \
	mkdir rootfs/etc && \
	mkdir rootfs/bin && \
	mkdir rootfs/sbin && \
	mkdir rootfs/usr && \
	mkdir rootfs/usr/bin && \
	mkdir rootfs/usr/sbin && \
	mv rootfs/busybox rootfs/bin/ && \
	for util in $$(cat $(location :busybox_utils)); do ln -s /bin/busybox rootfs/$$util; done && \
	cd rootfs/ && ../$(location //mkrootfs) $$(find . ) ../$@",
    tools = [
        ":busybox_utils",
        "//mkrootfs",
    ],
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
