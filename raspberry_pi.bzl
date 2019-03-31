def _rpi_image_impl(ctx):
    config = ctx.actions.declare_file("config.txt")
    ctx.actions.write(config, "initramfs {} followkernel\n".format(ctx.file.rootfs.basename))
    ctx.actions.run(
        inputs = ctx.files.boot_files + [config, ctx.file.rootfs] + ctx.files.overlays,
        outputs = [ctx.outputs.out],
        arguments = [f.path for f in ctx.files.boot_files] + [config.path, ctx.file.rootfs.path, "--output", ctx.outputs.out.path, "--overlays"] + [f.path for f in ctx.files.overlays],
        executable = ctx.executable._mkpiimage,
        progress_message = "Building SD card image",
    )

rpi_image = rule(
    attrs = {
        "rootfs": attr.label(
            mandatory = True,
            allow_single_file = True,
        ),
        "boot_files": attr.label_list(
            allow_files = True,
            mandatory = True,
        ),
        "overlays": attr.label_list(
            allow_files = True,
            allow_empty = True,
        ),
        "out": attr.output(mandatory = True),
        "_mkpiimage": attr.label(
            executable = True,
            cfg = "host",
            allow_files = True,
            default = Label("@minimal_linux_bazel//mkpiimage"),
        ),
    },
    implementation = _rpi_image_impl,
)
