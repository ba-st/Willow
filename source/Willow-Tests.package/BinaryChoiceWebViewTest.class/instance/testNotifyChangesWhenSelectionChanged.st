tests-Binary Choice-API
testNotifyChangesWhenSelectionChanged

	| binaryChoiceView |

	binaryChoiceView := self newBinaryChoiceView.
	binaryChoiceView notifyChangesTo: self.

	notificationWasReceived := false.
	binaryChoiceView toggleCurrentSelection.
	self assert: notificationWasReceived