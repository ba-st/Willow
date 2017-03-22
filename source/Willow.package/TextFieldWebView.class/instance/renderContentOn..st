rendering
renderContentOn: aCanvas

	| component |

	component := componentBuilder value: aCanvas.
	component
		value: self contents;
		callback: [ :aString | self changeContentsTo: aString ].

	identifierAssigner withAssignedIdentifierDo: [ :id | component id: id ].
	commandToComponent applyTo: component on: aCanvas.
	interactionInterpreter applyTo: component on: aCanvas