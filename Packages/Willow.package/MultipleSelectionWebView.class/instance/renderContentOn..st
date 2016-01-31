rendering
renderContentOn: aCanvas

	| component |
	component := self renderedComponentOn: aCanvas.
	component
		selected: selectedElements;
		list: self obtainContents;
		callback: [:element | self choose: element].
	self identify: component.
	interactionInterpreter applyTo: component on: aCanvas