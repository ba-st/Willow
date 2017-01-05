instance creation
unlabeledInteractingThrough: anInteractionInterpreter applying: aComponentCommand

	^ self
		labeledWithContentOf: self noLabelHolder
		interactingThrough: anInteractionInterpreter
		applying: aComponentCommand