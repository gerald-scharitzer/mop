from mop import Package, Repository

fn main():
	print("Usage: mop install package")
	var package = Package("package")
	var repository = Repository()
	try:
		var content = repository.get_package(package.name)
		package.install()
	except e:
		print(e)
