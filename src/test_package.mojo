from testing import assert_equal, assert_raises, assert_true

from mop import Package

fn test_package() raises -> None:
	alias MOJOPKG = "mojopkg"
	alias PACKAGE = "📦"
	# test parameters: user, shortname, extension, expected_extension, error
	var tests = List(
		List("", "mopy", "", MOJOPKG, ""),
		List("", "mopy", MOJOPKG, MOJOPKG, ""),
		List("", "mopy", PACKAGE, PACKAGE, ""),
		List("gerald-scharitzer", "mopy", "", MOJOPKG, ""),
		List("", ".", "", "", "alphanumeric")
	)
	for test in tests:
		var args = test[]
		var user = str(args[0])
		var shortname = str(args[1])
		var extension = str(args[2])
		var expected_extension = str(args[3])
		var error = str(args[4])
		if len(error) == 0:
			package_test(user, shortname, extension, expected_extension)
		else:
			with assert_raises(contains=error):
				package_test(user, shortname, extension, expected_extension)

fn package_test(user: String, shortname: String, extension: String, expected_extension: String) raises -> None:
	var longname = user + "/" + shortname
	var package: Package
	if len(extension) == 0:
		package = Package(shortname)
	else:
		package = Package(shortname, extension)
	var filename = shortname + "." + expected_extension
	assert_equal(package.name, shortname)
	assert_equal(package.extension, expected_extension)
	assert_equal(package.get_filename(), filename)
	# FIXME var uri = package.install()
