rendering - private
assignIdentifierTo: anInput on: aCanvas

	currentInputIdentifier := (IdentifierAssigner prefixedBy: 'input') identifyIn: aCanvas.

	anInput id: currentInputIdentifier