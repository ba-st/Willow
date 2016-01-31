accessing
identifierPrefixedBy: anIdentifierPrefix using: aRendererIdentifier

	| identifier |

	identifier := anIdentifierPrefix , '-' , aRendererIdentifier.
	IdentifierValidator new validate: identifier.
	^ identifier