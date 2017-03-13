rendering
renderContentOn: aCanvas

	| select |

	select := aCanvas multiSelect.
	select
		list: availableElements;
		callback: [ :elements | self chooseAllIn: elements ];
		selected: chosenElements.
	identifierHolder withContentDo: [ :id | select id: id ].
	interactionInterpreter applyTo: select on: aCanvas.
	commandToComponent applyTo: select on: aCanvas