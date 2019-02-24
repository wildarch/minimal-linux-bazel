genrule(
    name = "rootfs",
    srcs = [
        "@busybox//file",
        ":init",
    ],
    outs = ["rootfs.gz"],
    cmd = "mkdir rootfs/ && \
	(echo $(SRCS) | xargs cp -t rootfs/) && \
	chmod +x rootfs/init && \
	chmod +x rootfs/busybox && \
	mkdir rootfs/dev && \
	mkdir rootfs/proc && \
	mkdir rootfs/sys && \
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

# depends on 'xorriso' being available
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
		    xorriso -as mkisofs \
			-o $@ \
			-b isolinux.bin \
			-c boot.cat \
			-no-emul-boot \
			-boot-load-size 4 \
			-boot-info-table \
			root/",
)
