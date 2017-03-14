initialize-release
initializeChoosingFrom: aCollection

	answerView := (SingleSelectionListBoxWebView displayingAtOnce: 5)
		allowAnyOf: aCollection;
		yourself