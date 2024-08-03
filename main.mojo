from mop import Package

fn main():
	print("Usage: mop install package")
	var package = Package("package")
	try:
		package.install()
	except e:
		print(e)
