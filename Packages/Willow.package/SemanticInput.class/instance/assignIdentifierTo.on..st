rendering - private
assignIdentifierTo: anInput on: aCanvas

	currentInputIdentifier := IdentifierAssigner new
		identifierPrefixedBy: 'input'
		using: aCanvas nextId.
		
	anInput id: currentInputIdentifier