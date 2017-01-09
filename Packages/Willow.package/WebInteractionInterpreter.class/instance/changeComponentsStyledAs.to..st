Configuring - CSS
changeComponentsStyledAs: anExistingStyle to: aNewStyle
	self
		deprecated: 'Please use #onAjaxSuccessChangeCssClass:to: instead.'
		transformWith: '`@receiver changeComponentsStyledAs: `@anExistingStyle to: `@aNewStyle' -> '@receiver onAjaxSuccessChangeCssClass: `@anExistingStyle to: `@aNewStyle'.
	self onAjaxSuccessChangeCssClass: anExistingStyle to: aNewStyle