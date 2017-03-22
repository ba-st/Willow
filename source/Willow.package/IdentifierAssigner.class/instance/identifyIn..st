Configuring
identifyIn: aCanvas

	^ identifierHolder
		withContentDo: [ :identifier | identifier ]
		ifUnused: [ | identifier |

			identifier := '<1s>-<2s>' expandMacrosWith: prefix asString with: aCanvas nextId asString.
			HTMLAsserter new assertIsValidIdentifier: identifier.
			identifierHolder := Optional containing: identifier.
			identifier ]