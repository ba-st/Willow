rendering
renderContentOn: aCanvas

	| component |
	component := aCanvas span.
	interactionInterpreter applyTo: component on: aCanvas.
	propertyCommands do: [:command | command value: component value: aCanvas].
	component with: contentProvider value