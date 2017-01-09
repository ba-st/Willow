Configuring - CSS
onAjaxSuccessChangeCssClass: anExistingStyle to: aNewStyle
	interaction
		onTriggerExecute:
			(ModelLoadingComponentStyleClassChangingCommand
				onAjaxSuccessChange: anExistingStyle
				to: aNewStyle)