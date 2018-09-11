load("@build_bazel_rules_nodejs//:defs.bzl", "npm_install")

def mat_setup_workspace():
    """This repository rule should be called from your WORKSPACE file.

    It installs the dependencies to compile Angular Material into
    $(bazel info output_base)/external/angular_material_deps/node_modules
    """
    npm_install(
        name = "angular_material_deps",
        package_json = "@angular_material//:package.json",
        package_lock_json = "@angular_material//:package-lock.json",
        node_modules_filegroup = """
filegroup(
  name = "node_modules",
  # Performance workaround: list individual files
  # Reduces the number of files as inputs to nodejs_binary:
  # bazel query "deps(:node_modules)" | wc -l
  # This won't scale in the general case.
  # TODO(alexeagle): figure out what to do
  srcs = glob(["/".join(["node_modules", pkg, "**", ext]) for pkg in [
    "@angular",
    "@angular-devkit",
    "@schematics",
    "@types",
    "bytebuffer",
    "hammerjs",
    "jasmine",
    "long",
    "minimist",
    "moment",
    "parse5",
    "protobufjs",
    "protractor",
    "reflect-metadata",
    "rxjs",
    "tsickle",
    "tslib",
    "tslint",
    "tsutils",
    "typescript",
    "zone.js",
  ] for ext in [
    "*.js",
    "*.json",
    "*.d.ts",
  ]] + [
    "node_modules/http-server/**",
  ]),
)
"""
    )