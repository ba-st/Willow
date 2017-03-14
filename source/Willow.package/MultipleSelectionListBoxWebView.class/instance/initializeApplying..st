initialization
initializeApplying: aCommandToComponent

	interested := Set new.
	commandToComponent := aCommandToComponent.
	interactionInterpreter := WebInteractionInterpreter forChangeInHiddenInputDependentComponentValue.
	identifierHolder := UnusedHolder explainedBy: 'Identifier never requested so far'.
	self disallowAll