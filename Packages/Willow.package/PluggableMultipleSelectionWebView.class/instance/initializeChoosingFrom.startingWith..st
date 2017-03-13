initialize-release
initializeChoosingFrom: aCollection startingWith: initialSelection

	answerView := MultipleSelectionListBoxWebView applying: (SetComponentSizeCommand setting: 5).
	answerView
		allowAnyOf: aCollection;
		chooseAllIn: initialSelection