Configuring
identifyIn: aCanvas

	^ identifierHolder
		withContentDo: [ :identifier | identifier ]
		ifUnused: [ | identifier |

			identifier := '<1s>-<2s>' expandMacrosWith: prefix greaseString with: aCanvas nextId greaseString.
			HTMLAsserter new assertIsValidIdentifier: identifier.
			identifierHolder := Optional containing: identifier.
			identifier ]