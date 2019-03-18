genrule(
    name = "rootfs",
    srcs = [
        "@e1000//:e1000.ko",
        "//application",
    ],
    outs = ["rootfs.gz"],
    cmd = "mkdir rootfs/ && \
    cp $(location @e1000//:e1000.ko) rootfs/e1000.ko && \
    cp $(location //application) rootfs/init && \
	mkdir rootfs/dev && \
	mkdir rootfs/proc && \
	mkdir rootfs/sys && \
	cd rootfs/ && ../$(location //mkrootfs) $$(find . ) ../$@",
    tools = [
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
