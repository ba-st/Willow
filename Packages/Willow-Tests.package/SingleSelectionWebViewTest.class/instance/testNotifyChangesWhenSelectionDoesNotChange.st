tests-Single Selection-API
testNotifyChangesWhenSelectionDoesNotChange

	| singleSelectionView |

	singleSelectionView := self newSingleSelectionView.
	singleSelectionView allowAnyOf: #(1).
	singleSelectionView notifyChangesTo: self.

	notificationWasReceived := true.

	singleSelectionView chooseAnySatisfying: [ :element | false ] ifNone: [ notificationWasReceived := false ].

	self
		deny: notificationWasReceived;
		assert: (singleSelectionView currentSelectionIfNone: [ 0 ]) equals: 0