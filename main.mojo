from mop import Package, Repository
from cli import run

alias USAGE = """\
Usage: mop install package
	installs package into the current directory as .mopkg file
"""

fn main():
	run()
	print(USAGE)
	var package = Package("mopy") # TODO move to test
	var repository = Repository()
	try:
		var content = repository.get_package(package.name)
		package.install()
	except e:
		print(e)
