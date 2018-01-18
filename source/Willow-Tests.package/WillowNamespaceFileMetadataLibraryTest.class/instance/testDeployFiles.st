tests
testDeployFiles

	self
		useFileTestingPlatformDuring: [ WillowNamespaceFileMetadataLibrary default deployFiles.
			self
				assert: GRPlatform current createdFolders equals: #('willow-4.1.0' 'willow-4.1.0/js');
				assert: GRPlatform current createdFiles equals: #('willow-4.1.0/js/willow.js') ]
