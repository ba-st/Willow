rendering
renderContentOn: aCanvas

	| component |
	component := aCanvas checkbox.
	component
		value: self contents;
		callback: [:value | self selected: value].
	self identify: component.
	interactionInterpreter applyTo: component on: aCanvas