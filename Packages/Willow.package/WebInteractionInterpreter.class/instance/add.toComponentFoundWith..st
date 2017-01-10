Configuring - CSS
add: aCssStyle toComponentFoundWith: aComponentProvider
	self
		deprecated: 'Please use #addCssClass:toComponentMatching: instead.'
		transformWith: '`@receiver add: `@aCssStyle toComponentFoundWith: `@aComponentProvider' -> '@receiver addCssClass: `@aCssStyle toComponentMatching: `@aComponentProvider'.
	self addCssClass: aCssStyle toComponentsMatching: aComponentProvider