initialize-release
initializeRepresenting: anElement describedBy: aDescription in: aGroup applying: aCommandCollection

	element := anElement.
	description := aDescription.
	commandsToComponent := aCommandCollection.
	interactionInterpreter := WebInteractionInterpreter forClickOnComponent.
	interactionInterpreter evaluate: [aGroup choose: element]