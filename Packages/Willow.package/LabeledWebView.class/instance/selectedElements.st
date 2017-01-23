accessing
selectedElements

	self
		deprecated: 'Use viewToLabel'
		transformWith: '`@receiver selectedElements' -> '`@receiver viewToLabel selectedElements'.
	^ viewToLabel selectedElements