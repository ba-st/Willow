tests-Multiple Selection-API
testChooseAllInWhenNotAvailable

	| listBox |

	listBox := self newListBox.
	listBox allowAnyOf: #(1).

	listBox notifyChangesTo: self.
	listBox chooseAllIn: #(1).

	notificationWasReceived := false.

	self assert: listBox currentSelection equals: #(1).

	listBox allowAnyOf: #(2 4).

	self assert: notificationWasReceived.
	self assert: listBox currentSelection isEmpty