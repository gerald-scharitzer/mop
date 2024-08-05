"""A Mojo repository contains packages."""

from python import Python

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
        return self.host + self.user + "/" + self.TAGS + "/" + package + ".tar.gz"
