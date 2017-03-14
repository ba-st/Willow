rendering
renderContentOn: aCanvas

	| identifier containerComponent |

	identifier := self identifyIn: aCanvas.
	containerComponent := self componentRenderedOn: aCanvas.
	commandToComponent applyTo: containerComponent on: aCanvas.
	containerComponent
		id: identifier;
		with: view