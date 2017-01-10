Configuring - CSS
changeComponentsStyledAs: anExistingStyle to: aNewStyle

	self
		deprecated: 'Please use #changeCssClass:to: instead.'
		transformWith:
			'`@receiver changeComponentsStyledAs: `@anExistingStyle to: `@aNewStyle'
				-> '`@receiver changeCssClass: `@anExistingStyle to: `@aNewStyle'.
	self changeCssClass: anExistingStyle to: aNewStyle