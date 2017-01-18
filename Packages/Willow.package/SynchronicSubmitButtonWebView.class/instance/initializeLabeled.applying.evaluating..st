initialization
initializeLabeled: aLabel applying: aCommandCollection evaluating: actionOnSubmit

	super initialize.

	label := aLabel.
	commandToComponent := aCommandCollection.
	submitCallback := actionOnSubmit.
	disabled := false