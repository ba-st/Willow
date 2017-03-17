initialization
initializeApplyingToEachRadioButton: aCommandToComponent renderingLabelsWith: aRenderingBlock

	commandToRadioButton := aCommandToComponent.
	interactionInterpreter := WebInteractionInterpreter forChangeInComponentValue.
	renderingBlock := aRenderingBlock 