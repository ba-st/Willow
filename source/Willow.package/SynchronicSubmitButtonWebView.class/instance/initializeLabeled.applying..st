initialization
initializeLabeled: aLabel applying: aCommandCollection

	label := aLabel.
	commandToComponent := aCommandCollection.
	interactionInterpreter := WebInteractionInterpreter forClickOnComponent.
	identifierAssigner := IdentifierAssigner prefixedBy: 'submit-button'