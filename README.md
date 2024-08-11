# 📦 Mojo Package Installer

Mojo packages are imported from [directories or package files](https://docs.modular.com/mojo/manual/packages) in the file system.
Installing a package stores it in the file system.

**⚠️ Warning 🧪 Experimental code 🚧 Under heavy construction**

The standard library [`builtin` package](https://docs.modular.com/mojo/stdlib/builtin/) is imported automatically.
The [other standard library packages](https://docs.modular.com/mojo/stdlib/algorithm/functional/)
are imported from the installation directory of the library.
Other packages are imported from the directory of the main module
or directories specified as `-I` options for the commands
[`mojo build`](https://docs.modular.com/mojo/cli/build#-i-path),
[`mojo run`](https://docs.modular.com/mojo/cli/run#-i-path), and
[`mojo package`](https://docs.modular.com/mojo/cli/package#-i-path).

What is the module search order?

# GitHub

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

## Rationale

Repository branches can be downloaded as `.zip` files via https://github.com/user/repo/archive/refs/heads/branch.zip where:

- `user` is the user name
- `repo` is the repository name
- `branch` is the branch name

Tags can be downloaded as `.zip` or `.tar.gz` files via https://github.com/user/repo/archive/refs/tags/tag.ext where:

- `tag` is the Git tag
- `ext` is `zip` or `tar.gz`

There is no label for the latest tag.

Releases can be downloaded just like tags and https://github.com/user/repo/releases/latest results in a redirect (HTTP 302 Found) to https://github.com/user/repo/releases/tag/release where `release` is the latest tag/release.

There is no web user interface (WUI) to download a subdirectory of a repository.
Repository files can be downloaded, but Mojo package files are output artifacts and thus not stored in Git repositories.

# 🎯 Goals

`mop install package` installs the `package` from a GitHub release as package file `package.mojopkg` or `package.📦` in the current directory.

## Todo

- dev scripts
- unit tests
- integration tests
- generate documentation
- review license

# 🪛 Develop

with [Git](https://git-scm.com/book),
[Mojo](https://docs.modular.com/mojo/manual/), and
[Python](https://docs.python.org/3/).

1. Clone with `git clone https://github.com/gerald-scharitzer/mop.git`
2. Enter with `cd mop`
3. Install Python packages with `python -m pip install -r requirements.txt`
4. Run with `mojo main.mojo`
5. Build with `mkdir -p target && mojo build -o target/mop main.mojo`
6. Execute with `target/mop`
7. Package with `mojo package -o target mop`
8. **TODO** Document with `mojo doc`
9. Sync `VERSION` in [`mop/__init__.mojo`](mop/__init__.mojo)
10. Stage with `git add`
11. Commit with `git commit -m "message"` where `message` describes the changes
12. Push branch with `git push`
13. Tag with `git tag version` where
	`version` is the letter `v` followed by the [semantic version](https://semver.org/)
14. Push tag with `git push origin tag` where `tag` is the version
15. Clean with `rm -r target`
