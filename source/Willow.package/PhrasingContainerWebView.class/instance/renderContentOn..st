rendering
renderContentOn: aCanvas

	| span |

	span := aCanvas span.
	interactionInterpreter applyTo: span on: aCanvas.
	commandToComponent applyTo: span on: aCanvas.
	span with: phrasingContentProvider value