Configuring - CSS
toggle: aCssStyle onComponentStyledAs: aComponentByStyleName using: anEffectSelector
	self
		deprecated: 'Please use #toggleCssClass:onComponentsWithClass:withEffect: instead.'
		transformWith:
			'`@receiver toggle: `@aCssStyle onComponentStyledAs: `@aComponentByStyleName using: `@anEffectSelector'
				-> '`@receiver toggleCssClass: `@aCssStyle onComponentsWithClass: `@aComponentByStyleName withEffect: `@anEffectSelector'.
	self toggleCssClass: aCssStyle onComponentsWithClass: aComponentByStyleName withEffect: anEffectSelector