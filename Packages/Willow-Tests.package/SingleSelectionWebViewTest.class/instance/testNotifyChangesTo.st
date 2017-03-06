tests-Single Selection-API
testNotifyChangesTo

	| singleSelectionView |

	singleSelectionView := self newSingleSelectionView.
	singleSelectionView notifyChangesTo: self.

	notificationWasReceived := false.
	singleSelectionView disallowAll.

	self assert: notificationWasReceived