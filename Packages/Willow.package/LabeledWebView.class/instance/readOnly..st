configuring
readOnly: aBoolean

	self
		deprecated: 'Use viewToLabel'
		transformWith: '`@receiver readOnly: `@aBoolean' -> '`@receiver viewToLabel readOnly: `@aBoolean'.
	viewToLabel readOnly: aBoolean