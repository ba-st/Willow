rendering
renderContentOn: aCanvas

	| div |

	div := aCanvas div.
	interactionInterpreter applyTo: div on: aCanvas.
	commandToComponent applyTo: div on: aCanvas. 
	div with: contentProvider value