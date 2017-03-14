rendering
renderContentOn: aCanvas

	| component |
	component := self renderedComponentOn: aCanvas.
	commandToComponent applyTo: component on: aCanvas.
	component with: [self renderRadioGroupOn: aCanvas]