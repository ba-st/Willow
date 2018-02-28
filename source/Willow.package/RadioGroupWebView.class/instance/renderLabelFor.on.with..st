private-rendering
renderLabelFor: radioButtonId on: aCanvas with: aRenderable

	| label |

	label := aCanvas label.
	label for: radioButtonId.
	labelCommand applyTo: label on: aCanvas.
	label with: aRenderable