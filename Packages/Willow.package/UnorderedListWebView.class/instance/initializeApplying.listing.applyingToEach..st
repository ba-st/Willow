initialize-release
initializeApplying: aComponentCommand listing: anElementCollection applyingToEach: anElementCommand

	listItemViews := anElementCollection
		collect: [ :anElement | ListItemWebView itemizing: anElement applying: anElementCommand ].
	commandToComponent := aComponentCommand