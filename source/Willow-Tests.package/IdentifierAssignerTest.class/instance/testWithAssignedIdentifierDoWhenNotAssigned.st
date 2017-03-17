test
testWithAssignedIdentifierDoWhenNotAssigned

	| assigner |

	assigner := IdentifierAssigner prefixedBy: 'table'.

	assigner withAssignedIdentifierDo: [ :id | self fail ]