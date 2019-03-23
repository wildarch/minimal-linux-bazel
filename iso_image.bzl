def _iso_image_impl(ctx):
    isolinux_cfg = ctx.actions.declare_file("isolinux.cfg")

    # TODO Make this more configurable?
    ctx.actions.write(isolinux_cfg, "default {} initrd={} console=ttyS0".format(
        ctx.file.kernel.basename,
        ctx.file.rootfs.basename,
    ))
    files = [ctx.file.rootfs, ctx.file.kernel, isolinux_cfg] + ctx.files.isolinux
    paths = [f.path for f in files]
    ctx.actions.run(
        inputs = files,
        outputs = [ctx.outputs.out],
        arguments = ["-o", ctx.outputs.out.path, "-b", "isolinux.bin", "-c", "boot.cat"] + paths,
        executable = ctx.executable._mkiso,
        progress_message = "Building iso9660 image",
    )

# TODO input sanitization
iso_image = rule(
    attrs = {
        "rootfs": attr.label(
            mandatory = True,
            allow_single_file = True,
        ),
        "kernel": attr.label(
            default = Label("@linux//:kernel"),
            allow_single_file = True,
        ),
        "out": attr.output(mandatory = True),
        "_mkiso": attr.label(
            executable = True,
            cfg = "host",
            allow_files = True,
            default = Label("@minimal_linux_bazel//mkiso"),
        ),
        "isolinux": attr.label(
            default = Label("@syslinux//:isolinux"),
            allow_files = True,
        ),
    },
    implementation = _iso_image_impl,
)
