tests-Single Selection-API
testNotifyChangesWhenSelectionChanged

	| singleSelectionView |

	singleSelectionView := self newSingleSelectionView.
	singleSelectionView allowAnyOf: #(1).

	singleSelectionView notifyChangesTo: self.

	notificationWasReceived := false.
	singleSelectionView chooseAnySatisfying: [ :element | true ] ifNone: [ self fail ].

	self assert: (singleSelectionView currentSelectionIfNone: [ self fail ]) equals: 1.
	self assert: notificationWasReceived