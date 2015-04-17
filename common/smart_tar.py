#!/usr/bin/env python

__doc__ = "Make a flattened tarball from input files"

import tarfile

import sys, os

# test that we can import other files
#import bazel_py_binary
#from bazel_py_binary.common.other_file import SOME_CONSTANT
#from common.other_file import SOME_CONSTANT
#assert SOME_CONSTANT == 42

output_name = sys.argv[1]
inputs = sys.argv[2:]

assert output_name.endswith(".tgz")
assert inputs

tar = tarfile.open(output_name, "w:gz")
for input in inputs:
    tar.add(input, arcname=os.path.basename(input))
tar.close()
