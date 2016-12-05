initialize-release
initializeObtainingImageFrom: anImageProvider applying: aCommandCollection

	imageProvider := anImageProvider.
	propertyCommands := aCommandCollection.
	interactionInterpreter := WebInteractionInterpreter forClickOnComponent