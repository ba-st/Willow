initialization
initializeApplying: aCommandToComponent

	commandToComponent := aCommandToComponent.
	interactionInterpreter := WebInteractionInterpreter forChangeInComponentValue.
	identifierAssigner := IdentifierAssigner prefixedBy: 'list-box'