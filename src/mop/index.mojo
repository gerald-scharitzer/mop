"""Store package information beyond its file or directory.

Write package information to the index file in the current directory.
"""

struct Index:
	var links: List[String]
	
	fn __init__(inout self) -> None:
		self.links = List[String]()
	
	fn add_link(inout self, link: String) -> None:
		self.links.append(link)
	
	fn save(self) raises -> None:
		alias NEWLINE: StringRef = "\n"
		var file = open("package-links.csv", "w")
		for link in self.links:
			file.write(link[])
			file.write(NEWLINE)
		file.close()
