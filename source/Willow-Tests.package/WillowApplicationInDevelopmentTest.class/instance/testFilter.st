tests-accessing
testFilter

	| filtered |

	filtered := WillowApplicationInDevelopment new filter: WAAbstractFileLibrary libraries.

	self
		assert: (filtered includes: WillowTestingFileMetadataDevelopmentLibrary);
		deny: (filtered includes: WillowTestingFileMetadataDeploymentLibrary)