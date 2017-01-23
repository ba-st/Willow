accessing
selectedElement

	self
		deprecated: 'Use viewToLabel'
		transformWith: '`@receiver selectedElement' -> '`@receiver viewToLabel selectedElement'.
	^ viewToLabel selectedElement