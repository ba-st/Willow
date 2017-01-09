Configuring - CSS
remove: aCssStyle fromComponentStyledAs: aComponentByStyleName
	self
		deprecated: 'Please use #onAjaxSuccessRemoveCssClass:fromComponentsWithClass: instead.'
		transformWith: '`@receiver remove: `@aCssStyle fromComponentStyledAs: `@aComponentProvider' -> '@receiver onAjaxSuccessRemoveCssClass: `@aCssStyle fromComponentsWithClass: `@aComponentProvider'.
	self onAjaxSuccessRemoveCssClass: aCssStyle fromComponentsWithClass: aComponentByStyleName