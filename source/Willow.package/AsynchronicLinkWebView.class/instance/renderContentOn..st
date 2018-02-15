rendering
renderContentOn: aCanvas

	| anchor |

	anchor := aCanvas anchor.
	interactionInterpreter applyTo: anchor on: aCanvas.
	commandToComponent applyTo: anchor on: aCanvas.
	anchor with: label