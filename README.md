# 📦 Mojo Package Manager

Build Mojo packages from projects.

[Magic](https://docs.modular.com/magic/) is a package manager for Mojo projects.
Build Mojo packages such that they can be published, searched, added, and installed.

**⚠️ Warning 🧪 Experimental Code 🚧 Under Construction**

# 🔌 Use

`mop install <user>/<package>[==<version>]` installs the `<package>` from the GitHub repository `<package>` of the `<user>`
as package file `<package>.mojopkg` or `<package>.📦` in the current directory.
If `==<version>` is specified, then the specified `<version>` is installed. Otherwise, the latest release is installed.

Just `mop` without arguments prints the usage.

## Setup

Install Magic.

Pick a [release](https://github.com/gerald-scharitzer/mop/releases) and download it, or clone it from the Git repository.

[Build](#-develop) the main module, because Mojo does not support main functions in packages yet.

Check the version with `mop v`.

## Example

Install [Lightbug](https://github.com/saviorand/lightbug_http) with `mop i saviorand/lightbug_http`.

# 💡 Rationale

The standard library [`builtin` package](https://docs.modular.com/mojo/stdlib/builtin/) is imported automatically.
The [other standard library packages](https://docs.modular.com/mojo/stdlib/algorithm/functional/)
are imported from the installation directory of the library.
Other packages are imported from the directory of the main module
or directories specified as `-I` options for the commands
[`mojo build`](https://docs.modular.com/mojo/cli/build#-i-path),
[`mojo run`](https://docs.modular.com/mojo/cli/run#-i-path), and
[`mojo package`](https://docs.modular.com/mojo/cli/package#-i-path).

Mojo packages are imported from [directories or package files](https://docs.modular.com/mojo/manual/packages) in the file system.
Installing a package stores it in the file system.

What is the module search order?

## GitHub

Download the package from the latest release.
Try `.mojopkg` first, because that is the [default extension](https://docs.modular.com/mojo/cli/package#-o-path).

Publish a package by attaching the package file to a release.

1. Tag the branch with the package version.
2. Create a release from the tag and attach the package file.

Download the package from https://github.com/user/repo/releases/download/version/package.mojopkg where:

- `user` is the user name
- `repo` is the repository name and by default this is the package name
- `version` is the package version
- `package` is the package name

Repository branches can be downloaded as `.zip` files via https://github.com/user/repo/archive/refs/heads/branch.zip where:

- `user` is the user name
- `repo` is the repository name
- `branch` is the branch name

Tags can be downloaded as `.zip` or `.tar.gz` files via https://github.com/user/repo/archive/refs/tags/tag.ext where:

- `tag` is the Git tag
- `ext` is `zip` or `tar.gz`

There is no label for the latest tag.

Releases can be downloaded just like tags and https://github.com/user/repo/releases/latest results in a redirect (HTTP 302 Found) to https://github.com/user/repo/releases/tag/release where `release` is the latest tag/release.

If there are only pre-releases, then https://github.com/user/repo/releases/latest redirects to https://github.com/user/repo/releases.
Publish a release that is not a pre-release to enable finding the latest release.

There is no web user interface (WUI) to download a subdirectory of a repository.
Repository files can be downloaded, but Mojo package files are output artifacts and thus not stored in Git repositories.

# 🪛 Develop

with [Git](https://git-scm.com/book),
[Mojo](https://docs.modular.com/mojo/manual/), and
[Python](https://docs.python.org/3/).

1. Clone with `git clone https://github.com/gerald-scharitzer/mop.git`
2. Enter with `cd mop`
3. Install Python packages with `python -m pip install -r requirements.txt`
4. Test with `mojo test`
5. Run with `mojo src/main.mojo`
6. Build with `mkdir -p target && mojo build -o target/mop src/main.mojo`
7. Execute with `target/mop`
8. Package with `mojo package -o target src/mop`
9. Document with `mojo doc -o target/mop-doc.json src/mop`
10. Sync `VERSION` in [`mop/__init__.mojo`](src/mop/__init__.mojo) and [`test_mop.mojo`](src/test_mop.mojo)
11. Sync `USAGE` in [`cli.mojo`](src/cli.mojo) and [`README.md` section "Use"](#-use)
12. Stage with `git add`
13. Commit with `git commit -m "message"` where `message` describes the changes
14. Push branch with `git push`
15. Tag with `git tag version` where `version` is the [semantic version](https://semver.org/)
16. Push tag with `git push origin tag` where `tag` is the version
17. Clean with `rm -r target`

# ✨ Releases

are documented in the [release notes](releases.md).

# 📋 Backlog

Find a better name.

Store package source information in a file, such that the package can be obtained again and verified to be the same.
- name
- version
- URL
- cryptographic hash
- install time

See [SPDX](https://spdx.dev/) and [package URL](https://github.com/package-url/purl-spec).

Test with https://github.com/saviorand/lightbug_http.

`mojo doc` all source files, when it can generate something more human-readable than JSON.

- dev scripts
- unit tests
- integration tests
- doc tests
- review license

Support both filename extensions.

## Issues

Array of literals cannot be subscripted (runtime error).

Code diagnostics cannot resolve imports from nested tests.

## Scope

Process packages independent from their containing file system structure.
