instance creation
interpretedBy: anInputInterpreter interactingThrough: anInteractionInterpreter applying: aComponentCommand

	^ self new
		initializeInterpretedBy: anInputInterpreter
		interactingThrough: anInteractionInterpreter
		applying: aComponentCommand