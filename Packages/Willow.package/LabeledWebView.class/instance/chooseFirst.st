configuring
chooseFirst

	self
		deprecated: 'Use viewToLabel'
		transformWith: '`@receiver chooseFirst' -> '`@receiver viewToLabel chooseFirst'.
	viewToLabel chooseFirst