#!/usr/bin/env python

__doc__ = "Make a flattened tarball from input files"

import tarfile

import sys, os

output_name = sys.argv[1]
inputs = sys.argv[2:]

assert output_name.endswith(".tgz")
assert inputs

tar = tarfile.open(output_name, "w:gz")
for input in inputs:
    tar.add(input, arcname=os.path.basename(input))
tar.close()
