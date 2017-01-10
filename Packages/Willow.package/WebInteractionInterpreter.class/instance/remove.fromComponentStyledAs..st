Configuring - CSS
remove: aCssStyle fromComponentStyledAs: aComponentByStyleName

	self
		deprecated: 'Please use #removeCssClass:fromComponentsWithClass: instead.'
		transformWith:
			'`@receiver remove: `@aCssStyle fromComponentStyledAs: `@aComponentProvider'
				-> '`@receiver removeCssClass: `@aCssStyle fromComponentsWithClass: `@aComponentProvider'.
	self removeCssClass: aCssStyle fromComponentsWithClass: aComponentByStyleName