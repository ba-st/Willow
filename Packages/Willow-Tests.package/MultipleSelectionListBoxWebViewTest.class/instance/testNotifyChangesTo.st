tests-Multiple Selection-API
testNotifyChangesTo

	| singleSelectionView |

	singleSelectionView := self newListBox.
	singleSelectionView notifyChangesTo: self.

	notificationWasReceived := false.
	singleSelectionView disallowAll.

	self assert: notificationWasReceived