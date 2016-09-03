initialize-release
initializeTableBody

	identifiedTableBody := IdentifiedWebView
		forComponentBuiltUsing: [ :canvas | canvas tableBody ]
		named: 'TableBody'
		containing: [ :canvas | self renderTableRowsOn: canvas ]