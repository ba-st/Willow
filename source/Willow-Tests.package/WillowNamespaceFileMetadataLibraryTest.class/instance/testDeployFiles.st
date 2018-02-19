tests
testDeployFiles

	self
		useFileTestingPlatformDuring: [ WillowNamespaceFileMetadataLibrary default deployFiles.
			self
				assert: GRPlatform current createdFolders equals: #('willow-6.0.0' 'willow-6.0.0/js');
				assert: GRPlatform current createdFiles equals: #('willow-6.0.0/js/willow.js') ]
