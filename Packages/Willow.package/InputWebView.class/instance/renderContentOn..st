rendering
renderContentOn: aCanvas

	| component |
	component := self renderedComponentOn: aCanvas.
	component value: self contents.
	readOnly
		ifTrue: 
			[component
				readonly: true;
				tabIndex: 0]
		ifFalse: 
			[component callback: 
					[:aString |
					self obtainContentsFrom: [aString].
					afterContentObtainingCommand value: aString]].
	self identify: component.
	propertyCommands do: [:command | command value: component value: aCanvas].
	interactionInterpreter applyTo: component on: aCanvas