initialize-release
initializeAskingFor: aConcept

	answerView := LabeledWebView
		displaying: (SingleLineTextWebView triggeredOnChangeApplying: (SetComponentSizeCommand setting: 15))
		with: aConcept