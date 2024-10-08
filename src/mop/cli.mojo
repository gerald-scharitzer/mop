from mop import build, health, Index, pack, Repository, VERSION

alias USAGE = """\
Usage: mop [arguments]
Arguments:

	b | build
		Build executables from Magic projects.
	
	h | health
		Check fundamental assumptions like the encoding of ASCII digits and letters.
	
	i | install <user>/<package>[==<version>]
		Installs <package> from the GitHub repository of <user>
		into the current directory as .mojopkg file.
		If ==<version> is not specified, then the latest version is installed.
	
	p | pack
		Create Mojo packages from Magic projects.
	
	v | version
		Prints the version of this package.
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
			if arg == "b" or arg == "build":
				build()
				arg_state = ARG_STATE_NEW
			elif arg == "h" or arg == "health":
				try:
					health()
				except e:
					print(e)
					return EXIT_FAILURE
				arg_state = ARG_STATE_NEW
			elif arg == "i" or arg == "install":
				arg_state = ARG_STATE_INSTALL
			elif arg == "p" or arg == "pack":
				pack()
				arg_state = ARG_STATE_NEW
			elif arg == "v" or arg == "version":
				print(VERSION)
				arg_state = ARG_STATE_NEW
			else:
				print_usage()
				return EXIT_FAILURE
		elif arg_state == ARG_STATE_INSTALL:
			var package_name = arg
			var repository = Repository()
			try:
				_ = repository.get_package(package_name)
				# TODO print URI based on log level
			except e:
				raise Error("failed to get package " + str(package_name) + ": " + str(e))
			
			var index = Index()
			index.add_link(package_name)
			index.save()
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
