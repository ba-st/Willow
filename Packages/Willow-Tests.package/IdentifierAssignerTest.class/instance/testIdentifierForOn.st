test
testIdentifierForOn

	| assigner identifier |

	assigner := IdentifierAssigner new.
	identifier := assigner identifierFor: self on: self.
	self assert: identifier equals: 'theTestTag-theTestIdentifer'