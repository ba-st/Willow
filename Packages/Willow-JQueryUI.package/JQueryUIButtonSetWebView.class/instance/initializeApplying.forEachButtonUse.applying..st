initialization
initializeApplying: aCommandToComponent forEachButtonUse: aDefinition applying: aCommandToRadioButton

	commandToComponent := aCommandToComponent.
	commandToRadioButton := aCommandToComponent.
	radioButtonDefinition := aDefinition.
	interactionInterpreter := WebInteractionInterpreter forChangeInComponentValue