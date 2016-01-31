initialize-release
initializeDescribedBy: aDescription applying: aCommandToComponentCollection

	description := aDescription.
	interactionInterpreter := WebInteractionInterpreter forClickOnComponent.
	commandsToComponent := aCommandToComponentCollection