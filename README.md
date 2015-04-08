## Overview

Test workspace for issues with py_binary dependencies.

To set up:
```
ln -sf ~/bazel/tools/ tools
```

## Build Instructions

### Build All Fails

```
$ bazel build ...
```

Fails with a message about ```MoreElements$1.class```

### Build Package Fails

```
bazel build //my_package:simple_deployment
```

This fails because the dependent target ``//common/smart_tar`` does not get built before it is called.

### Build Succeeds

Manually running build commands in order succeeds.
```
bazel build //common:smart_tar
bazel build //my_package:simple_deployment
```
