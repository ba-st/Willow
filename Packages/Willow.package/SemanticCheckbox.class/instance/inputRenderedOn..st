rendering - private
inputRenderedOn: aCanvas

	| component |

	component := aCanvas checkbox.
	component
		value: self isChecked;
		callback: [ :aBoolean | self setCheckTo: aBoolean ].
	interactionInterpreter applyTo: component on: aCanvas.
	^ component