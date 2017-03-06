tests-Single Selection-API
testNotifyChangesWhenAvailableElementsChangeButNotContainsTheSelectedOne

	| singleSelectionView |

	singleSelectionView := self newSingleSelectionView.
	singleSelectionView allowAnyOf: #(1).

	singleSelectionView notifyChangesTo: self.
	singleSelectionView chooseAnySatisfying: [ :element | element = 1 ] ifNone: [ self fail ].

	notificationWasReceived := false.

	self assert: (singleSelectionView currentSelectionIfNone: [ self fail ]) equals: 1.

	singleSelectionView allowAnyOf: #(2 4).

	self
		assert: notificationWasReceived;
		assert: (singleSelectionView currentSelectionIfNone: [ 0 ]) equals: 0