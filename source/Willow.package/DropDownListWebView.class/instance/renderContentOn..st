rendering
renderContentOn: aCanvas

	| select |

	select := aCanvas select.
	commandToComponent applyTo: select on: aCanvas.
	select list: availableElements.
	select callback: [ :element | self choose: element ].
	chosenElementHolder withContentDo: [ :chosenElement | select selected: chosenElement ] ifUnused: [ self configure: select unselectingAllOn: aCanvas ].
	identifierAssigner withAssignedIdentifierDo: [ :id | select id: id ].
	interactionInterpreter applyTo: select on: aCanvas