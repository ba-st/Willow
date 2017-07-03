updating
updateRoot: aRoot

	super updateRoot: aRoot.
	aRoot title: self applicationTitle.
	aRoot htmlAttributes at: 'lang' put: self language greaseString.
	self jQueryLibrary updateRoot: aRoot.
	WillowNamespaceFileMetadataLibrary default updateRoot: aRoot.
	self componentSupplier updateRoot: aRoot