struct Package:
	var name: String

	fn __init__(inout self, name: String):
		self.name = name
	
	fn install(self) raises:
		var file_name = self.name + ".mojopkg"
		with open(file_name, "w") as file:
			file.write("package " + self.name) # TODO write package content
