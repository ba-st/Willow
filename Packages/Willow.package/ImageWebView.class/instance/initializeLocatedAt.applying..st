initialize-release
initializeLocatedAt: aLocation applying: aComponentCommand

	imageLocation := aLocation.
	commandToComponent := aComponentCommand.
	interactionInterpreter := WebInteractionInterpreter forClickOnComponent