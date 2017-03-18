instance creation
interpretedBy: aTextCodec interactingThrough: anInteractionInterpreter applying: aComponentCommand

	^ self new
		initializeInterpretedBy: aTextCodec
		interactingThrough: anInteractionInterpreter
		applying: aComponentCommand