tests-Multiple Selection-API
testNotifyChangesWhenSelectionDoesNotChange

	| listBox |

	listBox := self newListBox.
	listBox allowAnyOf: #(1).
	listBox notifyChangesTo: self.

	notificationWasReceived := false.

	listBox chooseAllIn: #().

	self
		assert: notificationWasReceived;
		assert: listBox currentSelection isEmpty