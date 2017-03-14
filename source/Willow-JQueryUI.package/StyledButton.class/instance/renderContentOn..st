rendering
renderContentOn: aCanvas

	"El orden es importante para que funcione!"

	| component |

	component := aCanvas button.
	interactionInterpreter applyTo: component on: aCanvas.
	commandsToComponent do: [ :command | command applyTo: component on: aCanvas ]