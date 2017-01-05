initialize-release
initializeChoosingFrom: aCollection startingWith: initialSelection

	answerView := (MultipleSelectionWebView displayingAtOnce: 5)
		obtainContentsFrom: [ aCollection ];
		choose: initialSelection;
		yourself