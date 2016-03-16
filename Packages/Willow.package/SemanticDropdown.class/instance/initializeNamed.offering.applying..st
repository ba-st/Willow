initialize-release
initializeNamed: aName offering: anOptionCollection applying: aComponentCommand

	name := aName.
	options := anOptionCollection.
	interactionInterpreter := WebInteractionInterpreter forChangeInComponentValue.
	selectionHolder := UnusedHolder explainedBy: 'Nothing selected'.
	componentCommand := aComponentCommand