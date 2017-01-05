instance creation
named: aName offering: anOptionCollection interactingThrough: anInteractionInterpreter applying: aComponentCommand

	^ self new
		initializeNamed: aName
		offering: anOptionCollection
		interactingThrough: anInteractionInterpreter
		applying: aComponentCommand