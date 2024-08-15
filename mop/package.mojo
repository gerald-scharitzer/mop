from .repository import Repository

struct Package:
	"""A Mojo package has a name.

	Attributes:
		name: The name of the package
		extension: The extension of the package
	"""
	
	var name: String
	var extension: String
	alias EXTENSION_MOJOPKG = ".mojopkg"
	alias EXTENSION_PACKAGE_CHARACTER = ".📦"

	fn __init__(inout self, name: String, extension: String = self.EXTENSION_MOJOPKG):
		self.name = name
		self.extension = extension
	
	fn get_filename(self) -> String:
		"""Get the package filename including extension."""
		return self.name + self.extension
	
	fn install(self) raises -> String:
		"""Get the package from the default repository and install the package into the current directory."""
		var file_name = self.name + self.extension
		var repository = Repository()
		var uri = repository.get_package(self.name) # writes the package content to the current directory
		# TODO write package content via mojo instead of python
		return uri
