struct Package:
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
	
	fn install(self) raises:
		var file_name = self.name + self.extension
		with open(file_name, "w") as file:
			file.write("package " + self.name) # TODO write package content
