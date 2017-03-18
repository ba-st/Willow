initialize-release
initializeInterpretedBy: aTextCodec interactingThrough: anInteractionInterpreter applying: aComponentCommand

	textCodec := aTextCodec.
	interactionInterpreter := anInteractionInterpreter.
	currentInputIdentifier := ''.
	componentCommand := CompositeComponentCommand
		applyingAll: (Array with: self uiInputStyleCommand with: aComponentCommand).
	self setUninterpretedContentTo: ''