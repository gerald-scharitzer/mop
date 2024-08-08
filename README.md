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

# 🎯 Goals

1. `mop install package` installs the `package` as package file `package.mojopkg` or `package.📦` in the current directory.
Try `.mojopkg` first, because that is the [default extension](https://docs.modular.com/mojo/cli/package#-o-path).

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
9. Stage with `git add`
10. Commit with `git commit -m "message"` where `message` describes the changes
11. Push branch with `git push`
12. Tag with `git tag version` where
	`version` is the letter `v` followed by the [semantic version](https://semver.org/)
13. Push tag with `git push origin tag` where `tag` is the version
14. Clean with `rm -r target`
