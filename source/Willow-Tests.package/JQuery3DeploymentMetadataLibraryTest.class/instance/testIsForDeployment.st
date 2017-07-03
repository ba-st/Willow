tests
testIsForDeployment

	self
		assert: JQuery3DeploymentMetadataLibrary isForDeployment;
		deny: JQuery3DeploymentMetadataLibrary isForDevelopment