rendering
renderContentOn: aCanvas

	| component |
	component := self renderedComponentOn: aCanvas.
	cssStyleNames do: [:aCssStyleName | component class: aCssStyleName].
	component
		list: self obtainContents;
		selected: selectedElement;
		callback: [:element | self choose: element].
	self identify: component.
	interactionInterpreter applyTo: component on: aCanvas