instance creation
labeled: aLabel interactingThrough: anInteractionInterpreter

	^ self
		labeledWithContentOf: (Optional containing: aLabel)
		interactingThrough: anInteractionInterpreter
		applying: CompositeComponentCommand empty