Configuring - CSS
addCssClass: aCssStyle
	interaction
		onTriggerExecute:
			(ComponentStyleClassChangingCommand
				on: [ :canvas | canvas jQuery this ]
				altering: aCssStyle
				sending: #addClass:)