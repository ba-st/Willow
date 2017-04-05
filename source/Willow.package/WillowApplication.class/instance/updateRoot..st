updating
updateRoot: aRoot

	super updateRoot: aRoot.
	aRoot title: self applicationTitle.
	self jQueryLibrary updateRoot: aRoot.
	self componentSupplier updateRoot: aRoot