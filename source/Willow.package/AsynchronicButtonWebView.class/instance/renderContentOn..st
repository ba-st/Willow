rendering
renderContentOn: aCanvas

	"We send bePush to the button because, by default, Seaside made it with type = submit"

	| pushButton |

	pushButton := aCanvas button.
	identifierAssigner withAssignedIdentifierDo: [ :id | pushButton id: id ].
	pushButton
		value: label;
		bePush.

	interactionInterpreter applyTo: pushButton on: aCanvas.
	commandToComponent applyTo: pushButton on: aCanvas