initialize-release
initializeInterpretedBy: anInputInterpreter interactingThrough: anInteractionInterpreter applying: aComponentCommand

	inputInterpreter := anInputInterpreter.
	interactionInterpreter := anInteractionInterpreter.
	componentCommand := CompositeComponentCommand
		applyingAll: (Array with: self uiInputStyleCommand with: aComponentCommand).
	self setUninterpretedContentTo: ''