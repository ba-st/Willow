accessing
identifierPrefixedBy: anIdentifierPrefix using: aRendererIdentifier
	| identifier |
	identifier := '<1s>-<2s>' expandMacrosWith: anIdentifierPrefix asString with: aRendererIdentifier asString.
	IdentifierValidator new validate: identifier.
	^ identifier