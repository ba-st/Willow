initialization
initializeApplying: aCommandToComponent

	commandToComponent := aCommandToComponent.
	interactionInterpreter := WebInteractionInterpreter forChangeInComponentValue.
	identifierAssigner := IdentifierAssigner prefixedBy: 'drop-down-list'