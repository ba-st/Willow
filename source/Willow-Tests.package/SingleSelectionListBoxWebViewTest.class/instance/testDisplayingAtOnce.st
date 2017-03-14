tests
testDisplayingAtOnce

	self
		should: [ SingleSelectionListBoxWebView displayingAtOnce: 1 ] raise: AssertionFailed;
		should: [ SingleSelectionListBoxWebView displayingAtOnce: 0 ] raise: AssertionFailed;
		should: [ SingleSelectionListBoxWebView displayingAtOnce: -51 ] raise: AssertionFailed