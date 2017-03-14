rendering
renderContentOn: aCanvas

	| anchor |

	anchor := aCanvas anchor.
	self setButtonRoleTo: anchor on: aCanvas.
	interactionInterpreter applyTo: anchor on: aCanvas.
	commandToComponent applyTo: anchor on: aCanvas.
	anchor with: label