tests-Multiple Selection-API
testNotifyChangesWhenSelectionChanged

	| listBox |

	listBox := self newListBox.
	listBox allowAnyOf: #(1).

	listBox notifyChangesTo: self.

	notificationWasReceived := false.
	listBox chooseAllIn: #(1).

	self assert: listBox chosenElements equals: #(1).
	self assert: notificationWasReceived