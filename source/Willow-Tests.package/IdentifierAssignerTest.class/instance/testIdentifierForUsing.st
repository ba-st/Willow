test
testIdentifierForUsing

	| assigner identifier |

	assigner := IdentifierAssigner new.
	identifier := assigner identifierFor: self using: 'specificId'.
	self assert: identifier equals: 'theTestTag-specificId'