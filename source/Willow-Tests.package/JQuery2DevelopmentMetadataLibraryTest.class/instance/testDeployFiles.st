tests
testDeployFiles

	self
		useFileTestingPlatformDuring: [ JQuery2DevelopmentMetadataLibrary default deployFiles.
			self
				assert: GRPlatform current createdFolders equals: #('jQuery-2.2.4');
				assert: GRPlatform current createdFiles equals: #('jQuery-2.2.4/jquery-2.2.4.js') ]