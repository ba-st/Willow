tests
testHanldesFolder

	self
		assert: (JQuery2DeploymentMetadataLibrary handlesFolder: JQuery2DeploymentMetadataLibrary folderName);
		deny: (JQuery2DeploymentMetadataLibrary handlesFolder: #files)