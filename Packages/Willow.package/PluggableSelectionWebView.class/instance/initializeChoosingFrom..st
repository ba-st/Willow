initialize-release
initializeChoosingFrom: aCollection

	answerView := (SingleSelectionWebView displayingAtOnce: 5)
		obtainContentsFrom: [ aCollection ];
		yourself