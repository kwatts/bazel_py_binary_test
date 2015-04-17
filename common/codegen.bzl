def impl(ctx):
    result = [ctx.file.tgt]
    for i in ctx.targets.deps:
        result += i.hdrs

    # Run a code generator on the input target, using dependent headers as input
    ctx.file_action(output=ctx.outputs.out, content=str(result))

    return struct(hdrs=result)

cc_codegen = rule(
    implementation=impl,
    attrs={
        "tgt": attr.label(single_file=True, allow_files=True),
        "deps": attr.label_list(providers=["hdrs"]),
    },
    outputs = {"hdrs": "%{name}.h"}
)
