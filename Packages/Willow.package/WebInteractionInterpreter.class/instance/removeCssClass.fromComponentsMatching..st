Configuring - CSS
removeCssClass: aCssStyle fromComponentsMatching: aComponentProvider

	interaction
		onTriggerExecute:
			(ComponentStyleClassChangingCommand
				on: aComponentProvider
				altering: aCssStyle
				sending: #removeClass:)