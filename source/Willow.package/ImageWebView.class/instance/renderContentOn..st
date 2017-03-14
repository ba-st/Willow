rendering
renderContentOn: aCanvas

	| component |
	component := self renderImageOn: aCanvas.
	interactionInterpreter applyTo: component on: aCanvas