# BUILD file needed for packaging utilities
package(default_visibility = ["//visibility:public"])

py_binary(
    name="smart_tar",
    srcs=["smart_tar.py"],
    deps=[":other_file"]
)

py_library(
    name="other_file",
    srcs=["other_file.py"],
)
