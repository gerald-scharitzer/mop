struct Package:
	var name: String

	fn __init__(inout self, name: String):
		self.name = name
	
	fn install(self):
		var file_name = self.name + ".mojopkg"
		print("TODO write", file_name)
