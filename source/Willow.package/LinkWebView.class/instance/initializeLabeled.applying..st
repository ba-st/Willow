initialization
initializeLabeled: aLabel applying: aComponentCommand

	label := aLabel.
	commandToComponent := aComponentCommand.
	interactionInterpreter := WebInteractionInterpreter forClickOnComponent