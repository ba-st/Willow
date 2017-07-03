tests
testHandlesFolder

	self
		assert: (JQuery2DevelopmentMetadataLibrary handlesFolder: JQuery2DevelopmentMetadataLibrary folderName);
		deny: (JQuery2DevelopmentMetadataLibrary handlesFolder: #files)