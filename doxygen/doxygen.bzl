def _doxygen_impl(ctx):
    output_dir = ctx.outputs.output_dir

    # Collect source files using Bazel's query
    result = ctx.actions.run_shell(
        command = "bazel query 'kind(\"source file\", deps(%s))' --output=package" % ctx.label.name,
        outputs = [ctx.actions.declare_file("source_files.txt")]
    )

    # Read the collected source files
    source_files = ctx.file.source_files.txt.read().strip().split()

    ctx.actions.run(
        inputs = source_files,
        outputs = [output_dir],
        arguments = [
            "-s", ctx.file.doxyfile.path,
            "-d", output_dir.path,
        ],
        executable = ctx.executable._doxygen,
        mnemonic = "Doxygen",
    )

doxygen_rule = rule(
    implementation = _doxygen_impl,
    attrs = {
        "target": attr.label(),
        "doxyfile": attr.label(allow_single_file = [".Doxyfile"]),
        "_doxygen": attr.label(
            executable = True,
            allow_files = True,
            default = "//tools/doxygen:doxygen",
            cfg = "host",
        ),
    },
    outputs = {"output_dir": "%{name}/docs"},
)