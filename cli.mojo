from mop import Package, Repository, VERSION

alias USAGE = """\
Usage: mop [arguments]
Arguments:

	i | install package
		installs package into the current directory as .mojopkg file
	
	v | version
		prints the version of this package
"""

alias EXIT_SUCCESS = 0
alias EXIT_FAILURE = 1
alias EXIT_INFO = 2

fn run(args: VariadicList[StringRef]) raises -> Int:
	alias ARG_STATE_COMMAND = 0
	alias ARG_STATE_NEW = 1
	alias ARG_STATE_INSTALL = 2

	if len(args) < 2:
		print_usage()
		return EXIT_INFO
	
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
				return EXIT_FAILURE
		elif arg_state == ARG_STATE_INSTALL:
			var package_name = arg
			var package = Package(package_name)
			var repository = Repository()
			try:
				var content = repository.get_package(package.name) # FIXME return value
			except e:
				raise Error("failed to get package " + str(package_name) + ": " + str(e))
			arg_state = ARG_STATE_NEW
		else:
			raise Error("invalid argument state " + str(arg_state) + " at index " + str(argx))
		argx += 1

	if arg_state != ARG_STATE_NEW: # last argument not complete
		print_usage()
		return EXIT_FAILURE
	
	return EXIT_SUCCESS

fn print_usage():
	print(USAGE, end="")
