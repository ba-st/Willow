Configuring - CSS
toggle: aCssStyle onComponentFoundWith: aComponentProvider
	self
		deprecated: 'Please use #toggleCssClass:onComponentsMatching: instead.'
		transformWith: '`@receiver toggle: `@aCssStyle onComponentFoundWith: `@aComponentProvider' -> '@receiver toggleCssClass: `@aCssStyle onComponentsMatching: `@aComponentProvider'.
	self toggleCssClass: aCssStyle onComponentsMatching: aComponentProvider