tests-accessing
testFilter

	| filtered |

	filtered := WillowApplicationDeployed new filter: WAAbstractFileLibrary libraries.

	self
		assert: (filtered includes: WillowTestingFileMetadataDeploymentLibrary);
		deny: (filtered includes: WillowTestingFileMetadataDevelopmentLibrary)