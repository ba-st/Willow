configuring
remove: aCssStyle fromComponentFoundWith: aComponentProvider

	interaction
		onTriggerExecute:
			(ComponentStyleCommandServerIndependent
				removing: aCssStyle
				fromComponentFoundWith: aComponentProvider)