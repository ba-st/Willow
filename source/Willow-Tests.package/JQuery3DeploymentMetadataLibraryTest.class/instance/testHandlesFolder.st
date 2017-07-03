tests
testHandlesFolder

	self
		assert: (JQuery3DeploymentMetadataLibrary handlesFolder: JQuery3DeploymentMetadataLibrary folderName);
		deny: (JQuery3DeploymentMetadataLibrary handlesFolder: #files)