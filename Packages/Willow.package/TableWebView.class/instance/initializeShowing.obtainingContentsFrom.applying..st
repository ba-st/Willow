initialize-release
initializeShowing: aColumnDefinitionCollection obtainingContentsFrom: aContentsProvider applying: aComponentCommand

	super initialize.
	columnDefinitions := aColumnDefinitionCollection.
	contentsProvider := aContentsProvider.
	componentCommand := aComponentCommand