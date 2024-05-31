def _collect_sources(target):
    all_sources = depset(direct=[target.files],)
    return all_sources

def _generate_docs_impl(ctx):
    target = ctx.attr.target
    source_files_output = ctx.actions.declare_file(ctx.attr.name + "_source_files.txt")

    # Collect all source files from the target and its transitive dependencies
    all_sources = _collect_sources(target)
    
    print(all_sources)

    # Write the source files paths to the output file
    source_files_list = "\n".join([f.path for f in all_sources.to_list()])

    ctx.actions.write(
        output = source_files_output,
        content = source_files_list,
    )


    # You can then run Doxygen with this file as input
    doxygen_command = "doxygen -g %s && doxygen %s" % (source_files_output.path, source_files_output.path)

    ctx.actions.run_shell(
        command = doxygen_command,
        inputs = [source_files_output],
        outputs = [ctx.actions.declare_file(ctx.attr.name + "_doxygen_output")]
    )

    

doxygen_rule = rule(
    implementation = _generate_docs_impl,
    attrs = {
        "target": attr.label(mandatory=True),
    },
)