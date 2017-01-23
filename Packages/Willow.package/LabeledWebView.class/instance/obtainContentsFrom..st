configuring
obtainContentsFrom: aBlock

	self
		deprecated: 'Use viewToLabel'
		transformWith: '`@receiver obtainContentsFrom: `@aBlock' -> '`@receiver viewToLabel obtainContentsFrom: `@aBlock'.
	
	viewToLabel obtainContentsFrom: aBlock