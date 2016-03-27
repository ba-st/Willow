initialize-release
initializeTableBody

	identifiedTableBody := IdentifiedWebView
		referringTo: [ :canvas | self renderTableRowsOn: canvas ]
		as: 'TableBody'
		obtainingContainerComponentFrom: [ :canvas | canvas tableBody ]