from sys import exit

from cli import EXIT_FAILURE, EXIT_SUCCESS, run

fn main() -> None:
	var exit_code = EXIT_SUCCESS
	try:
		exit_code = run()
	except e:
		exit_code = EXIT_FAILURE
		print(e)
	if exit_code != EXIT_SUCCESS:
		exit(exit_code)
