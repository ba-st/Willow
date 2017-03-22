test
testAssignedIdentifier

	| assigner |

	assigner := IdentifierAssigner prefixedBy: 'table'.
	assigner identifyIn: self.
	self assert: assigner assignedIdentifier equals: 'table-123'