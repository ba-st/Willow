Accessing
assignedIdentifier

	^ identifierHolder
		withContentDo: [ :id | id ]
		ifUnused: [ :explanations | AssertionFailed signalAll: explanations ]