instance creation
definedBy: aColumnRendererCollection
	applying: aTableCommand
	headerRenderedBy: aHeader
	applyingToEachRow: aRowCommand

	^self new
		initializeDefinedBy: aColumnRendererCollection
		applying: aTableCommand asWebComponentCommand 
		headerRenderedBy: aHeader
		applyingToEachRow: aRowCommand asTableRowCommand