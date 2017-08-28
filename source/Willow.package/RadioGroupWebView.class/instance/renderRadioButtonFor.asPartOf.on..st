private-rendering
renderRadioButtonFor: anElement asPartOf: aRadioGroup on: aCanvas

	| radioButtonId |

	radioButtonId := (IdentifierAssigner prefixedBy: 'radio-button') identifyIn: aCanvas.
	self
		renderLabelFor: radioButtonId
		on: aCanvas
		with: [ | radioButton |
			radioButton := aRadioGroup radioButton.
			radioButton id: radioButtonId.
			commandToComponent applyTo: radioButton on: aCanvas.
			interactionInterpreter applyTo: radioButton on: aCanvas.
			radioButton value: anElement.
			self renderLabelContentFor: anElement on: aCanvas ]