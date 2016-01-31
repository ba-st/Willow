rendering
renderContentOn: aCanvas

	| component |
	component := self renderedComponentOn: aCanvas.
	commandsToComponent
		do: [:command | command value: component value: aCanvas].
	component with: [self renderRadioGroupOn: aCanvas]