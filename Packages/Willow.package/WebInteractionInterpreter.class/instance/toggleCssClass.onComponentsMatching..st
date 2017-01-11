Configuring - CSS
toggleCssClass: aCssStyle onComponentsMatching: aComponentProvider

	interaction
		onTriggerExecute:
			(ComponentStyleClassChangingCommand
				on: aComponentProvider
				altering: aCssStyle
				sending: #toggleClass:)