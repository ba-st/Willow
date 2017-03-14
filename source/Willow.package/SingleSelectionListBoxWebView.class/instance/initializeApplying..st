initialization
initializeApplying: aCommandToComponent

	commandToComponent := aCommandToComponent. 
	interactionInterpreter := WebInteractionInterpreter forChangeInComponentValue.
	identifierHolder := UnusedHolder explainedBy: 'Identifier never requested so far'.