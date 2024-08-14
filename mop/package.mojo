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

	fn __init__(inout self, name: String):
		self.name = name
		self.extension = self.EXTENSION_MOJOPKG

	fn __init__(inout self, name: String, extension: String):
		self.name = name
		self.extension = extension
	
	fn get(self) -> String:
		"""Get the package content."""
		# TODO get package from repository
		return self.name + self.extension
	
	fn get_filename(self) -> String:
		"""Get the package filename including extension."""
		return self.name + self.extension
	
	fn install(self) raises:
		var file_name = self.name + self.extension
		var repository = Repository()
		repository.get_package(self.name) # write the package content to the current directory
		# TODO write package content via mojo instead of python
