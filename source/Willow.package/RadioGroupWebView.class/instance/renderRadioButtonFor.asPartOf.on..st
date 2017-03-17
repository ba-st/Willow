private-rendering
renderRadioButtonFor: anElement asPartOf: aRadioGroup on: aCanvas

	| radioButtonId radioButton |

	radioButtonId := (IdentifierAssigner prefixedBy: 'radio-button') identifyIn: aCanvas.

	aCanvas label
		for: radioButtonId;
		with: [ radioButton := aRadioGroup radioButton.
			radioButton id: radioButtonId.
			commandToRadioButton applyTo: radioButton on: aCanvas.
			interactionInterpreter applyTo: radioButton on: aCanvas.
			radioButton value: anElement.
			aCanvas render: anElement ]