Multiple Selection-API
chosenElements

	self
		deprecated: 'Please use #currentSelection  instead'
		transformWith: '`@receiver chosenElements' -> '`@receiver currentSelection'.
	
	^chosenElements 