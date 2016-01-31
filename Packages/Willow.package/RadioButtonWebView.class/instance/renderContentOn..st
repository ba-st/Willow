rendering
renderContentOn: aCanvas

	| component |
	component := aCanvas radioButton.
	aCanvas ensureIdFor: component.
	commandsToComponent
		do: [:command | command value: component value: element value: aCanvas].
	component
		group: groupKey;
		value: element.
	interactionInterpreter applyTo: component on: aCanvas.
	(aCanvas label)
		for: component id;
		with: description