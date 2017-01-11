Configuring - CSS
toggleCssClass: aCssStyle onComponentsWithClass: aComponentByStyleName withEffect: anEffectSelector

	interaction
		onTriggerExecute:
			(ComponentStyleClassChangingCommand
				on: [ :canvas | canvas jQuery class: aComponentByStyleName ]
				altering: aCssStyle
				sending: #toggleClass:
				using: [ :component | 
					component effect
						times: 1;
						slow;
						perform: anEffectSelector ])