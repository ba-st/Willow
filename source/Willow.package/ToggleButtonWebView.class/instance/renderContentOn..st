rendering
renderContentOn: aCanvas
	"El orden es importante para que funcione!"

	| component |
	component := aCanvas checkbox.
	component
		value: isToggled;
		callback: [:shouldBeToggled | isToggled := shouldBeToggled].
	aCanvas ensureIdFor: component.
	interactionInterpreter applyTo: component on: aCanvas.
	component script: (aCanvas jQuery this button text: description).
	(aCanvas label)
		for: component id;
		with: description