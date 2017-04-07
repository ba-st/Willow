rendering
renderContentOn: aCanvas

	| submitButton |

	submitButton := aCanvas button.

	identifierAssigner withAssignedIdentifierDo: [ :id | submitButton id: id ].
	submitButton
		callback: submitCallback;
		value: label.

	interactionInterpreter applyTo: submitButton on: aCanvas.
	commandToComponent applyTo: submitButton on: aCanvas.
	submitButton disabled: disabled