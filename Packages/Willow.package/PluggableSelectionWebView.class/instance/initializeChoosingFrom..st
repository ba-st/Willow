initialize-release
initializeChoosingFrom: aCollection

	answerView := (MultiLineComboBoxWebView displayingAtOnce: 5)
				obtainContentsFrom: [aCollection];
				yourself