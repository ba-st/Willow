instance creation
headlessDefinedBy: aColumnRendererCollection applying: aTableCommand

	^ self
		definedBy: aColumnRendererCollection
		applying: aTableCommand
		headerRenderedBy: [ :canvas |  ]
		applyingToEachRow: CompositeComponentCommand empty