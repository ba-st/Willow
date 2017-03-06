tests-Multiple Selection-API
testNotifyChangesWhenSelectionNotChanged

	| listBox |

	listBox := self newListBox.
	listBox allowAnyOf: #(1).
	listBox notifyChangesTo: self.

	notificationWasReceived := false.

	listBox chooseAllIn: #().

	self
		assert: notificationWasReceived;
		assert: listBox chosenElements isEmpty