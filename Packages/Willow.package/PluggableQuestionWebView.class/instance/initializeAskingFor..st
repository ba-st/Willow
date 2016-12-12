initialize-release
initializeAskingFor: aConcept

	answerView := LabeledWebView displaying: ((SingleLineTextWebView new)
						setSizeTo: 15;
						yourself)
				with: aConcept