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
  # Performance consideration: list individual files, reducing the number of
  # files as inputs to nodejs_binary:
  # bazel query "deps(:node_modules)" | wc -l
  # This won't scale in the general case, but works for now.
  # Note that this does *not* include Angular and RxJS because we build them
  # from source.
  srcs = glob(["/".join(["node_modules", pkg, "**", ext]) for pkg in [
    "@angular-devkit",
    "@schematics",
    "@types",
    "bytebuffer",
    "hammerjs",
    "jasmine",
    "minimist",
    "moment",
    "long",
    "parse5",
    "protobufjs",
    "protractor",
    "reflect-metadata",
    "scss-bundle",
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
  ]) + ["@build_bazel_rules_typescript//:node_modules"],
    # "@build_bazel_rules_typescript//:node_modules" is incluced
    # in `//:node_modules` so that npm dependencies that are hoisted to
    # node_modules/@bazel/typescript/node_modules because of conflicting
    # versions can be resolved correctly,
)
        """
    )
