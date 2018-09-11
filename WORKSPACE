workspace(name = "angular_material")

# Add nodejs rules
http_archive(
    name = "build_bazel_rules_nodejs",
    url = "https://github.com/bazelbuild/rules_nodejs/archive/0.12.4.zip",
    strip_prefix = "rules_nodejs-0.12.4",
    sha256 = "c482700e032b4df60425cb9a6f8f28152fb1c4c947a9d61e6132fc59ce332b16",
)

# Add sass rules
http_archive(
  name = "io_bazel_rules_sass",
  url = "https://github.com/bazelbuild/rules_sass/archive/0.1.0.zip",
  strip_prefix = "rules_sass-0.1.0",
  sha256 = "b243c4d64f054c174051785862ab079050d90b37a1cef7da93821c6981cb9ad4",
)

# Add Angular rules (e.g. ng_module).
http_archive(
    name = "angular",
    url = "https://github.com/angular/angular/archive/6.1.7.zip",
    strip_prefix = "angular-6.1.7",
    sha256 = "bd6bd47b8b65254da78158b354c4b0ffc18b9591bcc82863e359fc8d3e1cc609",
)

# Add TypeScript rules. Use local_repository to add the rules from node_modules
# to get all of the transitive deps for rules_typescript (such as protobufjs).
local_repository(
  name = "build_bazel_rules_typescript",
  path = "node_modules/@bazel/typescript",
)

# Add rxjs
local_repository(
  name = "rxjs",
  path = "node_modules/rxjs/src",
)

load("@build_bazel_rules_typescript//:package.bzl", "rules_typescript_dependencies")
rules_typescript_dependencies()

# NOTE: this rule installs nodejs, npm, and yarn, but does NOT install
# your npm dependencies. You must still run the package manager.
load("@build_bazel_rules_nodejs//:defs.bzl", "node_repositories")
node_repositories(package_json = ["//:package.json"])

load("@io_bazel_rules_sass//sass:sass_repositories.bzl", "sass_repositories")
sass_repositories()

# Setup TypeScript Bazel workspace
load("@build_bazel_rules_typescript//:defs.bzl", "ts_setup_workspace", "check_rules_typescript_version")
ts_setup_workspace()

# 0.16.0: tsc_wrapped uses user's typescript version & check_rules_typescript_version
check_rules_typescript_version("0.16.0")

load("@angular//:index.bzl", "ng_setup_workspace")
ng_setup_workspace()

# This commit matches the version of buildifier in angular/ngcontainer
# If you change this, also check if it matches the version in the angular/ngcontainer
# version in /.circleci/config.yml
BAZEL_BUILDTOOLS_VERSION = "fd9878fd5de921e0bbab3dcdcb932c2627812ee1"

