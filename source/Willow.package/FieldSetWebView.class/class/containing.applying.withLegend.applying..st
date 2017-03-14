instance creation
containing: aWebView applying: fieldSetCommand withLegend: aTitle applying: legendCommand

	^ self new
		initializeContaining: aWebView
		applying: fieldSetCommand
		withLegend: aTitle
		applying: legendCommand