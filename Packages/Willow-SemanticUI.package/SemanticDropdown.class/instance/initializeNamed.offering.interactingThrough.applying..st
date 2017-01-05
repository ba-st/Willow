initialize-release
initializeNamed: aName offering: anOptionCollection interactingThrough: anInteractionInterpreter applying: aComponentCommand

	name := aName.
	options := anOptionCollection.
	interactionInterpreter := anInteractionInterpreter.
	selectionHolder := UnusedHolder explainedBy: 'Nothing selected'.
	componentCommand := aComponentCommand