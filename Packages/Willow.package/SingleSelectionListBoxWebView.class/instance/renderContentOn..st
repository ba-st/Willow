rendering
renderContentOn: aCanvas

	| select |

	select := aCanvas select.
	commandToComponent applyTo: select on: aCanvas.
	select list: availableElements.
	select callback: [ :element | self choose: element ].
	chosenElementHolder withContentDo: [ :chosenElement | select selected: chosenElement ].
	identifierHolder withContentDo: [ :id | select id: id ].
	interactionInterpreter applyTo: select on: aCanvas