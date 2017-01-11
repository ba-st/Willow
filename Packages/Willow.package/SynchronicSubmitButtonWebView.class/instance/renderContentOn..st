rendering
renderContentOn: aCanvas

	| component |

	component := aCanvas button.
	component
		id: buttonId;
		callback: submitCallback;
		value: label.

	commandToComponent applyTo: component on: aCanvas.
	component disabled: disabled