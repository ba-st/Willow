test
testIdentifierPrefixedByUsing

	| assigner |

	assigner := IdentifierAssigner new.

	self
		assert: (assigner identifierPrefixedBy: 'givenTag' using: 'specificId') equals: 'givenTag-specificId';
		assert: (assigner identifierPrefixedBy: 'table' using: 123) equals: 'table-123'