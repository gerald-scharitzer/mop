from testing import assert_equal, assert_raises, assert_true

from mop import Package

fn test_package() raises -> None:
	# test parameters: user, shortname, version, error
	var tests = List(
		List("", "mopy", "", ""),
		List("gerald-scharitzer", "mopy", "", ""),
		List("", ".", "", "alphanumeric")
	)
	alias HOST = "https://github.com/"
	alias USER = "gerald-scharitzer"
	alias PACKAGE = "mopy"
	alias MOJOPKG = "mojopkg"
	for test in tests:
		var user = str(test[][0])
		var shortname = str(test[][1])
		var version = str(test[][2])
		var error = str(test[][3])
		if len(error) == 0:
			package_test(user, shortname, version)
		else:
			with assert_raises(contains=error):
				package_test(user, shortname, version)

fn package_test(user: String, shortname: String, version: String) raises -> None:
	alias MOJOPKG = "mojopkg"
	var longname = user + "/" + shortname
	var package = Package(shortname)
	var extension = MOJOPKG
	var filename = shortname + "." + extension
	assert_equal(package.name, shortname)
	assert_equal(package.extension, extension)
	assert_equal(package.get_filename(), filename)
	# FIXME var uri = package.install()
