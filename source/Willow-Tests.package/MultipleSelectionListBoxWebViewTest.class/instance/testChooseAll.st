tests-Multiple Selection-API
testChooseAll

	| listBox |

	listBox := self newListBox.
	listBox allowAnyOf: #(1).

	listBox notifyChangesTo: self.
	listBox chooseAll.

	notificationWasReceived := false.

	self assert: listBox currentSelection equals: #(1).

	listBox allowAnyOf: #(2 4 3 1).

	self assert: notificationWasReceived.

	listBox chooseAll.

	self
		assert: notificationWasReceived;
		assert: listBox currentSelection equals: #(2 4 3 1)