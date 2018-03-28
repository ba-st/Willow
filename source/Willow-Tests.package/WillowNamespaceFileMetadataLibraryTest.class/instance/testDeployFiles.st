tests
testDeployFiles

	self
		useFileTestingPlatformDuring: [ WillowNamespaceFileMetadataLibrary default deployFiles.
			self
				assert: GRPlatform current createdFolders equals: #('willow-7.0.0' 'willow-7.0.0/js');
				assert: GRPlatform current createdFiles equals: #('willow-7.0.0/js/willow.js') ]
