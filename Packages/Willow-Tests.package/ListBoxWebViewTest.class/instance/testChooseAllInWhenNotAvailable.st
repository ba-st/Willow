tests-Multiple Selection-API
testChooseAllInWhenNotAvailable

	| listBox |

	listBox := self newListBox.
	listBox allowAnyOf: #(1).

	listBox notifyChangesTo: self.
	listBox chooseAllIn: #(1).

	notificationWasReceived := false.

	self assert: listBox chosenElements equals: #(1).

	listBox allowAnyOf: #(2 4).

	self assert: notificationWasReceived.
	self assert: listBox chosenElements isEmpty