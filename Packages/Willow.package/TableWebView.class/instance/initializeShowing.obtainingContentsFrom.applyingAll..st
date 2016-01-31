initialize-release
initializeShowing: aColumnDefinitionCollection obtainingContentsFrom: aContentsProvider applyingAll: aCommandCollection

	super initialize.
	columnDefinitions := aColumnDefinitionCollection.
	contentsProvider := aContentsProvider.
	propertyCommands := aCommandCollection