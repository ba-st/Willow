processing - private
identifyComponentOn: aCanvas

	| prefix |

	prefix := label select: [ :char | char isLetter ].
	prefix isEmpty
		ifTrue: [ prefix := 'view' ].
	viewToLabel identifyWith: (IdentifierAssigner new identifierPrefixedBy: prefix using: aCanvas nextId)