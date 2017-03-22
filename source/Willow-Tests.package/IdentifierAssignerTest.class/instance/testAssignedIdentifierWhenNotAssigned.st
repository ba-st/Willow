test
testAssignedIdentifierWhenNotAssigned

	| assigner |

	assigner := IdentifierAssigner prefixedBy: 'table'.

	self
		should: [ assigner assignedIdentifier ]
		raise: AssertionFailed
		withExceptionDo: [ :error | self assert: error messageText equals: 'The identifier was never assigned' ]