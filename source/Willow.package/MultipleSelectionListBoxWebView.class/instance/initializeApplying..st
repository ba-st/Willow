initialization
initializeApplying: aCommandToComponent

	interested := Set new.
	commandToComponent := aCommandToComponent.
	interactionInterpreter := WebInteractionInterpreter
		forChangeInHiddenInputDependentComponentValue.
	identifierAssigner := IdentifierAssigner prefixedBy: 'list-box'.
	self disallowAll