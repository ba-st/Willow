configuring
toggle: aCssStyle onComponentFoundWith: aComponentProvider

	interaction
		onTriggerExecute:
			(ComponentStyleCommandServerIndependent
				toggling: aCssStyle
				onComponentFoundWith: aComponentProvider)