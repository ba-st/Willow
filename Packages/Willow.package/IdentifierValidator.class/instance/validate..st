preconditions
validate: aName

	self deprecated: 'Use HTMLAsserter instead' transformWith: 'IdentifierValidator new validate: `@Name' -> 'HTMLAsserter new assertIsValidIdentifier: `@aName'.
	HTMLAsserter new assertIsValidIdentifier: aName