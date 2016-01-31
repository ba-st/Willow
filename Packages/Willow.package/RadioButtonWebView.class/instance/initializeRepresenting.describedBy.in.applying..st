initialize-release
initializeRepresenting: anElement describedBy: aDescription in: aGroup applying: aCommandCollection

	super initialize.
	element := anElement.
	description := aDescription.
	commandsToComponent := aCommandCollection.
	interactionInterpreter := WebInteractionInterpreter forClickOnComponent.
	interactionInterpreter evaluate: [aGroup choose: element]