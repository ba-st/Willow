instance creation
headedDefinedBy: aColumnRendererCollection applying: aTableCommand

	^ self
		definedBy: aColumnRendererCollection
		applying: aTableCommand
		headerRenderedBy: (TableHeaderWebView definedBy: aColumnRendererCollection)
		applyingToEachRow: [ :row |  ]