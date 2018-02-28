initialization
initializeRenderingWith: aRenderingBlock
	applyingToLabel: aLabelCommand
	applyingToInput: anInputCommand

	labelCommand := aLabelCommand.
	inputCommand := anInputCommand.
	interactionInterpreter := WebInteractionInterpreter forChangeInComponentValue.
	renderingBlock := aRenderingBlock