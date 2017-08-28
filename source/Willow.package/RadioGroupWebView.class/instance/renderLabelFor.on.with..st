private-rendering
renderLabelFor: radioButtonId on: aCanvas with: aRenderable

	| label |

	label := aCanvas label.
	label for: radioButtonId.
	commandToComponent applyTo: label on: aCanvas.
	label with: aRenderable