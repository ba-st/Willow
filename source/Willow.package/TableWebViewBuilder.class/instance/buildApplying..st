Building
buildApplying: aComponentCommand

	^ TableWebView
		definedBy: columnRenderers
		applying: tableCommand + aComponentCommand
		headerRenderedBy: (headerProvider value: columnRenderers)
		applyingToEachRow: rowCommand