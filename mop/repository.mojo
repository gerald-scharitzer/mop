"""A Mojo repository contains packages."""

from python import Python, PythonObject

struct Repository:
    var host: String
    alias HOST_GITHUB = "https://github.com/"
    var user: String
    alias USER_DEFAULT = "gerald-scharitzer"
    alias TAGS = "archive/refs/tags"

    fn __init__(inout self):
        self.host = self.HOST_GITHUB
        self.user = self.USER_DEFAULT

    fn get_package(self, package: String) raises -> String:
        # TODO get package from repository
        var requests = Python.import_module("requests")
        var uri: String = self.host + self.user + "/" + package + "/tree/main/" + package # TODO change to tag
        var response = requests.get(uri)
        if response.status_code != requests.codes.OK:
            raise Error("Get package: " + response.status_code)
        
        var content_type = response.headers["content-type"]
        print(content_type) # FIXME remove
        if content_type != "text/html; charset=utf-8": # FIXME change to packages and archives
            raise Error("Get package content type: " + content_type)
        var content = response.content # TODO this is a Mojo PythonObject of a Python bytes-like object
        # TODO Python way: write to package file via Python API
        # TODO Mojo way: wrap this in an interator that returns Strings of at most the buffer size
        return self.host + self.user + "/" + self.TAGS + "/" + package + ".tar.gz"
