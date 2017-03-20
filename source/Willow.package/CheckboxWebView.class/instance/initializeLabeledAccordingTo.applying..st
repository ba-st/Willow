initialization
initializeLabeledAccordingTo: anOptionalLabel applying: aCommandToComponent

	labelOptional := anOptionalLabel.
	commandToComponent := aCommandToComponent.
	interactionInterpreter := WebInteractionInterpreter forClickOnHiddenInputDependentComponent.
	identifierAssigner := IdentifierAssigner prefixedBy: 'checkbox'.
	isChecked := true