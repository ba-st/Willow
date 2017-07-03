tests
testIsForDeployment

	self
		assert: JQuery2DeploymentMetadataLibrary isForDeployment;
		deny: JQuery2DeploymentMetadataLibrary isForDevelopment