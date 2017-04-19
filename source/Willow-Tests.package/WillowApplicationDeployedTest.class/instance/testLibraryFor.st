tests-accessing
testLibraryFor

	self
		assert: (WillowApplicationDeployed new libraryFor: WillowTestingFileMetadataLibrary)
		equals: WillowTestingFileMetadataDeploymentLibrary