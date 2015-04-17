# Description: Hello, World!

package(default_visibility = ["//visibility:public"])

load("//common/packaging", "deploy")
load("//common/codegen", "cc_codegen")

deploy(
    name = "simple_deployment",
    configs = ["my_file.txt"],
)

cc_library(
    name = "foobar",
    srcs = ["lib_src.cc"],
    hdrs = ["include.h"],
)

cc_codegen(
    name = "generated",
    tgt = "struct_stub.h",
    deps = ["foobar"],
)
