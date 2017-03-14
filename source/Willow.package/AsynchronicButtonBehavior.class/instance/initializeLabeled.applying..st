initialization
initializeLabeled: aLabel applying: aComponentCommand

	super initialize.
	label := aLabel.
	commandToComponent := aComponentCommand.
	interactionInterpreter := WebInteractionInterpreter forClickOnComponent