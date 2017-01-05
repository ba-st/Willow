test
testIdentifierPrefixedByUsing

	| assigner identifier |

	assigner := IdentifierAssigner new.
	identifier := assigner identifierPrefixedBy: 'givenTag' using: 'specificId'.
	self assert: identifier equals: 'givenTag-specificId'