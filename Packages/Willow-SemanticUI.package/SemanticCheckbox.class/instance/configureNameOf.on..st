configuring - private
configureNameOf: anInput on: aCanvas

	| componentName |

	componentName := IdentifierAssigner new
		identifierPrefixedBy: 'checkbox'
		using: aCanvas nextId.
	anInput name: componentName