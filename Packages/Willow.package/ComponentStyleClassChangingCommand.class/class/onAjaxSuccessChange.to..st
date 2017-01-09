instance creation
onAjaxSuccessChange: theCurrentStyleClass to: theTargetStyleClass

	^ ModelLoadingComponentStyleClassChangingCommand
		on: [ :aCanvas | aCanvas jQuery class: theCurrentStyleClass ]
		altering: theCurrentStyleClass
		sending: #removeClass:
		using: [ :component | component addClass: theTargetStyleClass ]