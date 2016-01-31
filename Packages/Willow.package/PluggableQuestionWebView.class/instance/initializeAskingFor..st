initialize-release
initializeAskingFor: aConcept

	super initialize.
	answerView := LabeledWebView displaying: ((SingleLineTextWebView new)
						setSizeTo: 15;
						yourself)
				with: aConcept