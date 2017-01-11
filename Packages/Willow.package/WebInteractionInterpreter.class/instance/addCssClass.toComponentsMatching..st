Configuring - CSS
addCssClass: aCssStyle toComponentsMatching: aComponentProvider

	interaction
		onTriggerExecute:
			(ComponentStyleClassChangingCommand
				on: aComponentProvider
				altering: aCssStyle
				sending: #addClass:)