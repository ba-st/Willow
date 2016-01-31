initialize-release
initializeObtainingImageFrom: anImageProvider applying: aCommandCollection

	super initialize.
	imageProvider := anImageProvider.
	propertyCommands := aCommandCollection.
	interactionInterpreter := WebInteractionInterpreter forClickOnComponent