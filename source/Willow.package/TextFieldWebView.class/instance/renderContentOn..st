rendering
renderContentOn: aCanvas

	| component |

	component := componentBuilder value: aCanvas.
	component
		value: self contents;
		callback: [ :aString | self changeContentsTo: aString ].

	identifierHolder withContentDo: [ :id | component id: id ].
	commandToComponent applyTo: component on: aCanvas.
	interactionInterpreter applyTo: component on: aCanvas