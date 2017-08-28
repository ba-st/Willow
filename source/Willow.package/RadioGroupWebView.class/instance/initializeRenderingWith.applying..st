initialization
initializeRenderingWith: aRenderingBlock applying: aCommandToComponent

	commandToComponent := aCommandToComponent.
	interactionInterpreter := WebInteractionInterpreter forChangeInComponentValue.
	renderingBlock := aRenderingBlock