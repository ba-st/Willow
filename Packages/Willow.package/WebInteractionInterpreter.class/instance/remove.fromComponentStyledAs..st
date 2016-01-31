configuring
remove: aCssStyle fromComponentStyledAs: aComponentByStyleName

	interaction
		onTriggerExecute: (ComponentStyleChangingCommand for: aComponentByStyleName
				removing: aCssStyle)