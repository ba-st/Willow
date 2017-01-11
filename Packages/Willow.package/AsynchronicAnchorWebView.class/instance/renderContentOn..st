rendering
renderContentOn: aCanvas

	"El orden es importante para que funcione!"

	| component |

	component := aCanvas anchor.
	interactionInterpreter applyTo: component on: aCanvas.
	commandsToComponent do: [ :command | command value: component value: aCanvas ].
	component with: description