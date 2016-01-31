configuring
toggle: aCssStyle onComponentStyledAs: aComponentByStyleName using: anEffectSelector

	interaction onTriggerExecute: (ComponentStyleChangingCommand
				for: aComponentByStyleName
				toggling: aCssStyle
				sending: anEffectSelector)