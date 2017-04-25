initialization
initializeApplyingToEachRadioButton: aCommandToRadioButton andToEachLabel: aCommandToLabel renderingWith: aRenderingBlock

	commandToRadioButton := aCommandToRadioButton.
	commandToLabel := aCommandToLabel.
	interactionInterpreter := WebInteractionInterpreter forChangeInComponentValue.
	renderingBlock := aRenderingBlock 