tests-Single Selection-API
testNotifyChangesWhenAvailableElementsChangeButContainsTheSelectedOne

	| singleSelectionView |

	singleSelectionView := self newSingleSelectionView.
	singleSelectionView allowAnyOf: #(1).

	singleSelectionView notifyChangesTo: self.
	singleSelectionView chooseAnySatisfying: [ :element | element = 1 ] ifNone: [ self fail ].

	notificationWasReceived := false.

	self assert: (singleSelectionView currentSelectionIfNone: [ self fail ]) equals: 1.

	singleSelectionView allowAnyOf: #(2 4 3 1).

	self assert: notificationWasReceived.
	self assert: (singleSelectionView currentSelectionIfNone: [ self fail ]) equals: 1