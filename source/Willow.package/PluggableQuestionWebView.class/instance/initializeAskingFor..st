initialize-release
initializeAskingFor: aConcept

	answerView := LabeledWebView
		displaying: aConcept
		boundTo:
			(TextFieldWebView
				singleLineTriggeringOnChangeApplying: (SetComponentSizeCommand setting: 15))
		applying: CompositeComponentCommand empty