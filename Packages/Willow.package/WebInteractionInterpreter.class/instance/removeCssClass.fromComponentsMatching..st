Configuring - CSS
removeCssClass: aCssStyle fromComponentsMatching: aComponentProvider
	interaction
		onTriggerExecute:
			(ServerIndependentComponentStyleClassChangingCommand
				removing: aCssStyle
				fromComponentsMatching: aComponentProvider)