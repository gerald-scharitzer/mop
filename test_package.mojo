from testing import assert_equal, assert_true

from mop import Package

fn test_package() raises -> None:
    alias HOST = "https://github.com/"
    alias USER = "gerald-scharitzer"
    alias PACKAGE = "mopy"
    alias MOJOPKG = ".mojopkg"
    var shortname = PACKAGE
    var longname = USER + "/" + shortname
    var package = Package(shortname)
    var extension = MOJOPKG
    var filename = shortname + extension
    assert_equal(package.name, shortname)
    assert_equal(package.extension, extension)
    assert_equal(package.get_filename(), filename)
    # FIXME var uri = package.install()
