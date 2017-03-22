accessing
id

	self
		deprecated: 'Use identifier instead'
		transformWith: '`@receiver id' -> '`@receiver identifier'.
	^ self identifier