tests
testHandlesFolder

	self
		assert: (JQuery3DevelopmentMetadataLibrary handlesFolder: JQuery3DevelopmentMetadataLibrary folderName);
		deny: (JQuery3DevelopmentMetadataLibrary handlesFolder: #files)