rendering
renderContentOn: aCanvas

	| select |

	select := aCanvas multiSelect.
	commandToComponent applyTo: select on: aCanvas.
	select list: availableElements.
	select callback: [ :elements | self choose: elements ].
	select selected: chosenElements.
	identifierHolder withContentDo: [ :id | select id: id ].
	interactionInterpreter applyTo: select on: aCanvas