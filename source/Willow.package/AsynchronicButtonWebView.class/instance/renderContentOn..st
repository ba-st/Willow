rendering
renderContentOn: aCanvas

	"We send bePush to the button because, by default, Seaside made it with type = submit"

	| component |

	component := aCanvas button.
	component
		id: buttonId;
		value:  label;
		bePush.

	interactionInterpreter applyTo: component on: aCanvas.
	commandToComponent  applyTo: component on: aCanvas