instance creation
onAjaxSuccessRemove: aCssStyle forComponentsWithClass: aComponentByStyleName

	^ModelLoadingComponentStyleClassChangingCommand
		on: [:aCanvas | aCanvas jQuery class: aComponentByStyleName]
		altering: aCssStyle
		sending: #removeClass:
		using: [:component | component]