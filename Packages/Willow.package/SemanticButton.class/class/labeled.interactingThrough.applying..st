instance creation
labeled: aLabel interactingThrough: anInteractionInterpreter applying: aComponentCommand

	^ self new
		initializeLabeled: aLabel
		interactingThrough: anInteractionInterpreter
		applying: aComponentCommand