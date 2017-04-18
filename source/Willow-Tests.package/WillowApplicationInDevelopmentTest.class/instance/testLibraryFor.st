tests-accessing
testLibraryFor

	self
		assert: (WillowApplicationInDevelopment new libraryFor: WillowTestingFileMetadataLibrary)
		equals: WillowTestingFileMetadataDevelopmentLibrary