Configuring - CSS
toggleCssClass: aCssStyle onComponentsMatching: aComponentProvider
	interaction
		onTriggerExecute:
			(ServerIndependentComponentStyleClassChangingCommand
				toggling: aCssStyle
				onComponentsMatching: aComponentProvider)