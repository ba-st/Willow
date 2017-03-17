test
testWithAssignedIdentifierDo

	| assigner |

	assigner := IdentifierAssigner prefixedBy: 'table'.
	assigner identifyIn: self.

	assigner withAssignedIdentifierDo: [ :id | self assert: id equals: 'table-123' ]