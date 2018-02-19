initialization
initializeLabeled: aLabel applying: aCommandCollection evaluating: actionOnSubmit

	label := aLabel.
	commandToComponent := aCommandCollection.
	interactionInterpreter := WebInteractionInterpreter forClickOnComponent.
	submitCallback := actionOnSubmit.
	identifierAssigner := IdentifierAssigner prefixedBy: 'submit-button'