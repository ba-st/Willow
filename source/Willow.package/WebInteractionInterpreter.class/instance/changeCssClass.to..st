Configuring - CSS
changeCssClass: anExistingStyle to: aNewStyle

	interaction
		onTriggerExecute:
			(ComponentStyleClassChangingCommand
				on: [ :canvas | canvas jQuery class: anExistingStyle ]
				altering: anExistingStyle
				sending: #removeClass:
				using: [ :component | component addClass: aNewStyle ])