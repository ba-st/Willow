Configuring - CSS
toggle: aCssStyle onComponentStyledAs: aComponentByStyleName using: anEffectSelector
	self
		deprecated: 'Please use #onAjaxSuccessToggleCssClass:onComponentsWithClass:withEffect: instead.'
		transformWith:
			'`@receiver toggle: `@aCssStyle onComponentStyledAs: `@aComponentByStyleName using: `@anEffectSelector'
				-> '`@receiver onAjaxSuccessToggleCssClass: `@aCssStyle onComponentsWithClass: `@aComponentByStyleName withEffect: `@anEffectSelector'.
	self onAjaxSuccessToggleCssClass: aCssStyle onComponentsWithClass: aComponentByStyleName withEffect: anEffectSelector