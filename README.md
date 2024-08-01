# Mojo Packages

are imported from [directories or package files](https://docs.modular.com/mojo/manual/packages) in the file system.
Installing a package stores it in the file system.

The standard library [`builtin` package](https://docs.modular.com/mojo/stdlib/builtin/) is imported automatically.
The [other standard library packages](https://docs.modular.com/mojo/stdlib/algorithm/functional/)
are imported from the installation directory of the library.
Other packages are imported from the directory of the main module
or directories specified as `-I` options for the commands
[`mojo build`](https://docs.modular.com/mojo/cli/build#-i-path) and
[`mojo run`](https://docs.modular.com/mojo/cli/run#-i-path) and
[`mojo package`](https://docs.modular.com/mojo/cli/package#-i-path).

What is the module search order?

# Goals

1. `mop install package` installs the `package` in the current directory.

# Develop

1. Run source with `mojo mop.mojo`
2. Build with `mojo build mop.mojo`
3. Run executable with `./mop`
4. **TODO** Package with `mojo package`
