rendering
renderContentOn: aCanvas

	| submitButton |

	submitButton := aCanvas button.

	identifierAssigner withAssignedIdentifierDo: [ :id | submitButton id: id ].
	submitButton value: label.

	interactionInterpreter applyTo: submitButton on: aCanvas.
	commandToComponent applyTo: submitButton on: aCanvas