"""mop - Mojo Package Installer

See usage in [cli.mojo](mop/cli.mojo).
"""
from sys import argv, exit

from mop.cli import EXIT_FAILURE, EXIT_SUCCESS, run

fn main() -> None: # TODO main in package is not supported yet
	var args = argv()
	var exit_code = EXIT_SUCCESS
	try:
		exit_code = run(args)
	except e:
		exit_code = EXIT_FAILURE
		print(e)
	if exit_code != EXIT_SUCCESS:
		exit(exit_code)
