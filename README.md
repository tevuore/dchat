README
======

**WHAT**: dchat is command line AI chat application.

**STATUS**: Under heavy initial development

**GOAL**: Create AI chat that is easy to use from command line and can be used in various server
environments.

# Setup

At the moment there is no precompiled binaries available. You need to install Dart SDK.

Requires:
* Dart >= 3.0.0.
  * Install Dart from https://dart.dev/get-dart or use dvm

Configuration:
* TODO config file with API keys

Download dependencies with `dart pub get`.
 
To run tests execute `dart test` in the root directory of the project.

# Build & Run

```bash
# Easy way to build & run
$ dart run bin/dchat.dart

# Show help
$ dart run bin/dchat.dart --help
# Help for specific command
$ dart run bin/dchat.dart test -h

# If you prefer binary you can compile it
$ dart compile exe bin/dchat.dart
```

## Implementation Details

### JSON to Dart model

Classes for JSON are generated and generated files are under `lib/models/generated`.

To regenerate model classes from json, run
`dart run json_to_model -o lib/models/generated`.

The json_to_model uses flutter foundation package which is not available in plain Dart.
Replace flutter foundation import with meta package in generated files under `lib/models/generated`.
 * `import 'package:flutter/foundation.dart';` -> `import 'package:meta/meta.dart';`

Finally run `dart format lib/models/generated`
