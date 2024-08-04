struct Repository:
    var host: String
    alias HOST_GITHUB = "https://github.com/"
    var user: String
    alias USER_DEFAULT = "gerald-scharitzer"
    alias TAGS = "archive/refs/tags"

    fn __init__(inout self):
        self.host = self.HOST_GITHUB
        self.user = self.USER_DEFAULT

    fn get_package(self, package: String) -> String:
        # TODO get package from repository
        return self.host + self.user + "/" + self.TAGS + "/" + package + ".tar.gz"
