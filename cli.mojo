from sys import argv

alias USAGE = """\
Usage: mop install package
	installs package into the current directory as .mojopkg file
"""

fn run():
	alias ARG_STATE_COMMAND = 0
	alias ARG_STATE_NEW = 1
	alias ARG_STATE_INSTALL = 2
	alias ARG_STATE_PACKAGE = 3

	var args = argv()
	if len(args) < 2:
		print(USAGE)
		return
	
	var arg_state = ARG_STATE_COMMAND
	for arg in args:
		if arg_state == ARG_STATE_COMMAND:
			arg_state = ARG_STATE_NEW
		elif arg_state == ARG_STATE_NEW:
			if arg == "install":
				arg_state = ARG_STATE_INSTALL
				# TODO install package
				print("installing package")
			else:
				print(USAGE)
				return

	if arg_state != ARG_STATE_NEW: # last argument not complete
		print(USAGE)
		return
