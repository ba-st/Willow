initialization
initializeNamed: aName offering: anOptionCollection interactingThrough: anInteractionInterpreter applying: aComponentCommand

	name := aName.
	options := anOptionCollection.
	interactionInterpreter := anInteractionInterpreter.
	chosenElementHolder := Optional unusedBecause: 'There''s no element selected'.
	componentCommand := aComponentCommand