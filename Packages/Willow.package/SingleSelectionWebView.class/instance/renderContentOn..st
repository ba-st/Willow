rendering
renderContentOn: aCanvas

	| component |

	component := aCanvas select.
	commandToComponent applyTo: component on: aCanvas.
	component
		list: self obtainContents;
		selected: selectedElement;
		callback: [ :element | self choose: element ].
	self identify: component.
	interactionInterpreter applyTo: component on: aCanvas