initialize-release
initializeChoosingFrom: aCollection startingWith: initialSelection

	super initialize.
	answerView := (MultipleSelectionWebView displayingAtOnce: 5)
		obtainContentsFrom: [ aCollection ];
		choose: initialSelection;
		yourself