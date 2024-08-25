"""A Mojo repository contains packages."""

from python import Python, PythonObject

from .package import Package

struct Repository:
	var host: String
	alias HOST_GITHUB = "https://github.com/"
	var user: String
	alias USER_DEFAULT = "gerald-scharitzer"
	alias TAG = "tag/"
	alias TAGS = "archive/refs/tags"
	alias RELEASES = "/releases/"
	alias DOWNLOAD = "download/"
	alias LATEST = "latest"
	alias GITHUB_RELEASE = "https://objects.githubusercontent.com/github-production-release-asset-"

	fn __init__(inout self):
		self.host = self.HOST_GITHUB
		self.user = self.USER_DEFAULT

	fn get_package(self, package_name: String) raises -> String:
		"""Get the package content from the default repository and install the package into the current directory.
		
		Get latest release from https://github.com/user/repo/releases/latest.
		Download the package from https://github.com/user/repo/releases/download/version/package.mojopkg where:
		
		- `user` is the user name
		- `repo` is the repository name and by default this is the package name
		- `version` is the package version
		- `package` is the package name

		Args:
			package_name: The name of the package in the format `user/package`.
		
		Returns:
			The fully qualfied URI of the package.
		"""

		var parts = package_name.split("/", 1) # split after user
		var part_count = len(parts)
		var user: String
		var shortname: String
		if part_count == 1: # no user specified
			user = self.user
			shortname = parts[0]
		elif part_count == 2:
			user = parts[0]
			shortname = parts[1]
		else:
			raise Error("Invalid user in package name: " + package_name)
		
		parts = shortname.split("==", 1) # split after package name
		part_count = len(parts)
		var is_latest: Bool
		var version: String
		var uri: String
		if part_count == 1: # no version specified
			is_latest = True
			version = self.LATEST
		elif part_count == 2:
			is_latest = False
			shortname = parts[0]
			version = parts[1]
		else:
			raise Error("Invalid version in package name: " + package_name)

		var package = Package(shortname)
		var filename = package.get_filename()
		if is_latest:
			uri = self.host + user + "/" + shortname + self.RELEASES + self.LATEST
		else:
			uri = self.host + user + "/" + shortname + self.RELEASES + self.DOWNLOAD + version + "/" + filename

		var requests = Python.import_module("requests")
		var response = requests.get(uri, allow_redirects = False) # do not follow redirects to get the location instead of the html page
		if response.status_code == requests.codes.found:
			uri = str(response.headers["location"]) # TODO check location before using it
			if is_latest:
				var prefix = self.host + user + "/" + shortname + self.RELEASES + self.TAG
				if uri.startswith(prefix):
					version = uri[len(prefix):]
					uri = self.host + user + "/" + shortname + self.RELEASES + self.DOWNLOAD + version + "/" + filename
				else:
					raise Error("Get latest package location: " + uri)
			else:
				if not uri.startswith(self.GITHUB_RELEASE):
					raise Error("Get release package location: " + uri)
			response = requests.get(uri)
		
		if response.status_code != requests.codes.OK:
			var status = int(response.status_code)
			var http_status = "HTTP " + str(status)
			if status == 404: # TODO constant
				raise Error("Package " + package_name + " not found at " + uri + ": " + http_status)
			raise Error("Get package: " + http_status)
		
		var content_type = str(response.headers["content-type"])
		if content_type != "application/octet-stream":
			raise Error("Get package content type: " + content_type) # FIXME raising errors related to python objects seems to cause internal errors
		var content = response.content # TODO this is a Mojo PythonObject of a Python bytes-like object

		var pathlib = Python.import_module("pathlib")
		var path = pathlib.Path(filename)
		var package_file = path.open("wb")
		try:
			package_file.write(content)
		except:
			raise Error("Write package: " + shortname)
		finally:
			package_file.close()
		# TODO Mojo way: wrap this in an iterator that returns Strings of at most the buffer size
		return uri
