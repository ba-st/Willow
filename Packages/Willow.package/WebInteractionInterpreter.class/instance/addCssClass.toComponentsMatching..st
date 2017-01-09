Configuring - CSS
addCssClass: aCssStyle toComponentsMatching: aComponentProvider
	interaction
		onTriggerExecute:
			(ServerIndependentComponentStyleClassChangingCommand
				adding: aCssStyle
				toComponentsMatching: aComponentProvider)