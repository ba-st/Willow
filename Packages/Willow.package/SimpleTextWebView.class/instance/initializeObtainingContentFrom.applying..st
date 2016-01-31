initialize-release
initializeObtainingContentFrom: aContentProvider applying: aCommandCollection

	contentProvider := aContentProvider.
	propertyCommands := aCommandCollection.
	interactionInterpreter := WebInteractionInterpreter forClickOnComponent.