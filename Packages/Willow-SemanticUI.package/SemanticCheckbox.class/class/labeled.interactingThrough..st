instance creation
labeled: aLabel interactingThrough: anInteractionInterpreter

	^ self
		labeledWithContentOf: (Holder containing: aLabel)
		interactingThrough: anInteractionInterpreter
		applying: WebComponentCommand nullCommand