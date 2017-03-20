rendering
renderContentOn: aCanvas

	| checkbox |

	checkbox := aCanvas checkbox.
	commandToComponent applyTo: checkbox on: aCanvas.
	checkbox
		value: isChecked;
		callback: [ :value | self toggleCurrentSelection ].
	self renderOptionalLabelRelatedTo: checkbox on: aCanvas.
	interactionInterpreter applyTo: checkbox on: aCanvas