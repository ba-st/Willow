Building
buildApplying: aComponentCommand

	^ TableWebView
		definedBy: columnRenderers
		applying: tableCommand + aComponentCommand asWebComponentCommand 
		headerRenderedBy: (headerProvider value: columnRenderers)
		applyingToEachRow: rowCommand