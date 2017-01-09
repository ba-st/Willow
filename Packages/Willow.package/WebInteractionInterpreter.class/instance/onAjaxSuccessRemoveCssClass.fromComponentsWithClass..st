Configuring - CSS
onAjaxSuccessRemoveCssClass: aCssStyle fromComponentsWithClass: aComponentByStyleName
	interaction
		onTriggerExecute:
			(ModelLoadingComponentStyleClassChangingCommand
				onAjaxSuccessRemove: aCssStyle
				forComponentsWithClass: aComponentByStyleName)