rendering
renderContentOn: aCanvas

	| select |

	select := aCanvas select.
	select list: availableElements.
	select callback: [ :element | self choose: element ].
	identifierAssigner withAssignedIdentifierDo: [ :id | select id: id ].
	chosenElementOptional withContentDo: [ :chosenElement | select selected: chosenElement ] ifUnused: [ self configure: select unselectingAllOn: aCanvas ].
	interactionInterpreter applyTo: select on: aCanvas.
	commandToComponent applyTo: select on: aCanvas