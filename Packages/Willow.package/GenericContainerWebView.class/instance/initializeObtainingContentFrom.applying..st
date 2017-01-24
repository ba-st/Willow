initialization
initializeObtainingContentFrom: aContentProvider applying: aComponentCommand

	contentProvider := aContentProvider.
	commandToComponent := aComponentCommand.
	interactionInterpreter := WebInteractionInterpreter forClickOnComponent 