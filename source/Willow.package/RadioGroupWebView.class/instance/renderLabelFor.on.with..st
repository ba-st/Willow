private-rendering
renderLabelFor: radioButtonId on: aCanvas with: aRenderable

	| label |

	label := aCanvas label.
	label for: radioButtonId.
	commandToLabel applyTo: label on: aCanvas.
	label with: aRenderable