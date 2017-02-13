Configuring
setValueOf: anIdentifiedView to: aValueProvider

	self
		deprecated: 'Use setValueTo:thenTriggerChangeOf: instead'
		transformWith: '`@receiver setValueOf: `@anIdentifiedView to: `@aValueProvider' -> '`@receiver setValueTo: `@aValueProvider thenTriggerChangeOf: `@anIdentifiedView'.
	self setValueTo: aValueProvider thenTriggerChangeOf: anIdentifiedView