from sys import argv

fn run():
	var args = argv() # TODO check out prisma
	if len(args) != 3:
		print("Usage: mop install package") # TODO move to USAGE here
		return
