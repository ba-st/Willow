rendering
renderContentOn: aCanvas

	| component |

	component := aCanvas div.
	commandToComponent applyTo: component on: aCanvas.
	component with: contentsView