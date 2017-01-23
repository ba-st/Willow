rendering
renderContentOn: aCanvas

	| component |

	component := aCanvas button.
	component
		id: buttonId;
		callback: submitCallback;
		value: label.

	interactionInterpreter applyTo: component on: aCanvas.
	commandToComponent applyTo: component on: aCanvas.
	component disabled: disabled