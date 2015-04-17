# Tools for making a tarball of binaries and config files for deployment

def impl_deploy(ctx):
    paths = [ d.path for d in ctx.files.deps ]
    paths += [ c.path for c in ctx.files.configs ]

    ctx.action(
        executable=ctx.executable._smart_tar,
               inputs=ctx.files.configs + ctx.files.deps,
               outputs=[ctx.outputs.tarball],
        arguments=[ctx.outputs.tarball.path] + paths)

"""
Deployment:
 - Use the "smart_tar" program to make tarball
 - "configs" and "deps" will be input files
 - Output tarball will be "bazel-bin/PATH/TO/PACKAGE/rule.tgz"
"""

deploy = rule(
    implementation=impl_deploy,
    attrs = {
        "_smart_tar": attr.label(default=Label("//common:smart_tar"),
                                 executable=True, cfg=HOST_CFG),
        "configs": attr.label_list(allow_files=True),
        "deps": attr.label_list(),
    },
    outputs={"tarball": "%{name}.tgz"},
)
