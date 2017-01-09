Configuring - CSS
remove: aCssStyle fromComponentFoundWith: aComponentProvider
	self
		deprecated: 'Please use #removeCssClass:fromComponentsMatching: instead.'
		transformWith: '`@receiver remove: `@aCssStyle fromComponentFoundWith: `@aComponentProvider' -> '@receiver removeCssClass: `@aCssStyle fromComponentsMatching: `@aComponentProvider'.
	self removeCssClass: aCssStyle fromComponentsMatching: aComponentProvider