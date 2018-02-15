initialization
initializeLabeled: aLabel applying: aComponentCommand

	label := aLabel.
	commandToComponent := aComponentCommand.
	identifierAssigner := IdentifierAssigner prefixedBy: 'button'.
	interactionInterpreter := WebInteractionInterpreter forClickOnComponent