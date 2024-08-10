from sys import argv

from mop import VERSION

alias USAGE = """\
Usage: mop [arguments]
Arguments:

	i | install package
		installs package into the current directory as .mojopkg file
	
	v | version
		prints the version of this package
"""

fn run() raises:
	alias ARG_STATE_COMMAND = 0
	alias ARG_STATE_NEW = 1
	alias ARG_STATE_INSTALL = 2

	var args = argv()
	if len(args) < 2:
		print_usage()
		return
	
	var argx = 0
	var arg_state = ARG_STATE_COMMAND
	for arg in args:
		if arg_state == ARG_STATE_COMMAND: # do nothing with the command name
			arg_state = ARG_STATE_NEW
		elif arg_state == ARG_STATE_NEW: # new argument sequence
			if arg == "i" or arg == "install":
				arg_state = ARG_STATE_INSTALL
			elif arg == "v" or arg == "version":
				print(VERSION)
				arg_state = ARG_STATE_NEW
			else:
				print_usage()
				return
		elif arg_state == ARG_STATE_INSTALL:
			var package_name = arg
			print("installing package " + str(package_name)) # TODO install package
			arg_state = ARG_STATE_NEW
		else:
			raise Error("invalid argument state " + str(arg_state) + " at index " + str(argx))
		argx += 1

	if arg_state != ARG_STATE_NEW: # last argument not complete
		print_usage()
		return

fn print_usage():
	print(USAGE, end="")
