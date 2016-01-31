initialize-release
initializeChoosingFrom: aCollection

	super initialize.
	answerView := (MultiLineComboBoxWebView displayingAtOnce: 5)
				obtainContentsFrom: [aCollection];
				yourself