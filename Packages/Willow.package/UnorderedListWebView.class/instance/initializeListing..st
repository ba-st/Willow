initialize-release
initializeListing: anElementCollection

	listItemViews := anElementCollection
				collect: [:anElement | ListItemWebView itemizing: anElement].
	cssStyleName := ''