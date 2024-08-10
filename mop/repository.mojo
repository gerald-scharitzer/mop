"""A Mojo repository contains packages."""

from python import Python, PythonObject

from .package import Package

struct Repository:
    var host: String
    alias HOST_GITHUB = "https://github.com/"
    var user: String
    alias USER_DEFAULT = "gerald-scharitzer"
    alias TAGS = "archive/refs/tags"

    fn __init__(inout self):
        self.host = self.HOST_GITHUB
        self.user = self.USER_DEFAULT

    fn get_package(self, package_name: String) raises -> String:
        """Get the package content."""

        var package = Package(package_name)
        var requests = Python.import_module("requests")
        var uri: String = self.host + self.user + "/" + package_name + "/tree/main/" + package_name # TODO change to tag
        var response = requests.get(uri)
        if response.status_code != requests.codes.OK:
            raise Error("Get package: " + response.status_code)
        
        var content_type = response.headers["content-type"]
        print(content_type) # FIXME remove
        if content_type != "text/html; charset=utf-8": # FIXME change to packages and archives
            raise Error("Get package content type: " + content_type) # FIXME raising errors related to python objects seems to cause internal errors
        var content = response.content # TODO this is a Mojo PythonObject of a Python bytes-like object

        var pathlib = Python.import_module("pathlib")
        var filename = package.get_filename()
        var path = pathlib.Path(filename)
        var package_file = path.open("wb")
        try:
            package_file.write(content)
        except:
            raise Error("Write package: " + package_name)
        finally:
            package_file.close()
        # TODO Mojo way: wrap this in an iterator that returns Strings of at most the buffer size
        return self.host + self.user + "/" + self.TAGS + "/" + package_name + ".tar.gz"
