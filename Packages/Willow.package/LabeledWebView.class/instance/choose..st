configuring
choose: anElement

	self
		deprecated: 'Use viewToLabel'
		transformWith: '`@receiver choose: `@anElement' -> '`@receiver viewToLabel choose: `@anElement'.
	viewToLabel choose: anElement