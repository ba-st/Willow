private-rendering
renderRadioButtonFor: anElement asPartOf: aRadioGroup on: aCanvas

	| radioButtonId radioButton |

	radioButtonId := (IdentifierAssigner prefixedBy: 'radio-button')
		identifyIn: aCanvas.

	radioButton := aCanvas radioButton.
	radioButton id: radioButtonId.
	commandToRadioButton applyTo: radioButton on: aCanvas.
	radioButton
		group: aRadioGroup;
		value: anElement.
	interactionInterpreter applyTo: radioButton on: aCanvas.
	aCanvas label
		for: radioButtonId;
		with: [ radioButton
				script:
					(aCanvas jQuery this button
						text: false;
						primaryIcon: (radioButtonDefinition value: anElement)) ]