tests
testDeployFiles

	self
		useFileTestingPlatformDuring: [ JQuery3DeploymentMetadataLibrary default deployFiles.
			self
				assert: GRPlatform current createdFolders equals: #('jQuery-3.2.1');
				assert: GRPlatform current createdFiles equals: #('jQuery-3.2.1/jquery-3.2.1.min.map' 'jQuery-3.2.1/jquery-3.2.1.min.js') ]