initialize-release
initializeAskingFor: aConcept

	answerView := LabeledWebView
		displaying:
			(TextFieldWebView
				singleLineTriggeringOnChangeApplying: (SetComponentSizeCommand setting: 15))
		with: aConcept