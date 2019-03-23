def _rust_rootfs_impl(ctx):
    toolchain = ctx.toolchains["@io_bazel_rules_rust//rust:toolchain"]

    # Check that we were given a linux musl init binary.
    if not toolchain.target_triple.endswith("linux-musl"):
        fail("Target '{}' is not supported, you must use a *-linux-musl target for init"
            .format(toolchain.target_triple))
    files = ctx.attr.init[DefaultInfo].data_runfiles.files
    init_path = ctx.attr.init[DefaultInfo].files_to_run.executable.path
    paths = [f.path for f in files]
    ctx.actions.run(
        inputs = files,
        outputs = [ctx.outputs.out],
        arguments = ["--init", init_path, "--output", ctx.outputs.out.path] + paths,
        executable = ctx.executable._mkrootfs,
        progress_message = "Building rootfs",
    )

load("@io_bazel_rules_rust//rust:private/rustc.bzl", "CrateInfo")

rust_rootfs = rule(
    attrs = {
        "init": attr.label(
            mandatory = True,
            providers = [
                DefaultInfo,
                # To make sure this is actually a valid rust target
                CrateInfo,
            ],
            executable = True,
            cfg = "target",
        ),
        "out": attr.output(mandatory = True),
        "_mkrootfs": attr.label(
            executable = True,
            cfg = "host",
            allow_files = True,
            default = Label("@minimal_linux_bazel//mkrootfs"),
        ),
    },
    toolchains = ["@io_bazel_rules_rust//rust:toolchain"],
    implementation = _rust_rootfs_impl,
)
