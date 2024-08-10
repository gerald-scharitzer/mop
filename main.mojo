from mop import Package, Repository
from cli import run

fn main():
	run()
	var package = Package("mopy") # TODO move to test
	var repository = Repository()
	try:
		var content = repository.get_package(package.name)
		package.install()
	except e:
		# TODO set exit code
		print(e)
