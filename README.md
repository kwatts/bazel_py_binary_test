## Overview

Demonstration of Python import problems.

To set up:
```
ln -sf ~/bazel/tools/ tools
```

## Build Instructions

Python programs called during compilation can't import other libraries from the workspace. The workspace is missing a top-level ```__init__.py``` file.

The program in ```my_package``` calls ```//common/smart_tar``` which tries to import ```//common/other_file```.

To duplicate::

```
$ bazel build //my_package:all --subcommands
```

To duplicate success, find the ```runfiles``` directory for the ```smart_tar``` executable::

```
touch /PATH/TO/SMART_TAR_RUNFILES/bazel_py_binary/__init__.py
```

## Run Instructions

Running the ```smart_tar``` program manually on the command line will fail::

```
$ ./bazel-bin/common/smart_tar --help
ImportError: No module named bazel_py_binary.common.other_file
```
