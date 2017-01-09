Configuring - CSS
onAjaxSuccessToggleCssClass: aCssStyle onComponentsWithClass: aComponentByStyleName withEffect: anEffectSelector
	interaction
		onTriggerExecute:
			(ModelLoadingComponentStyleClassChangingCommand
				onAjaxSuccessToggle: aCssStyle
				forComponentsWithClass: aComponentByStyleName
				withEffect: anEffectSelector)