instance creation
describedBy: aDescription applying: aCommandToComponentCollection

	self
		deprecated: 'Use AsynchronicButtonWebView'
		transformWith:
			' ButtonWebView describedBy: `@aDescription applying: `@aCommandToComponentCollection'
				-> 'AsynchronicButtonWebView labeled: `@aDescription applying: (CompositeComponentCommand applyingAll: `@aCommandToComponentCollection)'.
	^ AsynchronicButtonWebView labeled: aDescription applying: (CompositeComponentCommand applyingAll: aCommandToComponentCollection)