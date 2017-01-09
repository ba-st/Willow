instance creation
onAjaxSuccessToggle: aCssStyle forComponentsWithClass: aComponentByStyleName withEffect: anEffectSelector

	^ModelLoadingComponentStyleClassChangingCommand
		on: [:aCanvas | aCanvas jQuery class: aComponentByStyleName]
		altering: aCssStyle
		sending: #toggleClass:
		using: 
			[:component |
			(component effect)
				times: 1;
				slow;
				perform: anEffectSelector]