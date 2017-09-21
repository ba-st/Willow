instance creation
containing: aWebView applying: fieldSetCommand withLegend: aTitle applying: legendCommand

	^ self new
		initializeContaining: aWebView
		applying: fieldSetCommand asWebComponentCommand
		withLegend: aTitle
		applying: legendCommand asWebComponentCommand