configuring - private
configureNameOf: anInput on: aCanvas

	| componentName |

	componentName := (IdentifierAssigner prefixedBy: 'checkbox') identifyIn: aCanvas.
	anInput name: componentName