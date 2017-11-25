initialization
initializeApplying: aComponentCommand listing: anElementCollection applyingToEach: anElementCommand

	elements := anElementCollection.
	commandToItem := anElementCommand.
	commandToList := aComponentCommand.
	interactionInterpreter := WebInteractionInterpreter forClickOnComponent.
	identifierAssigner := IdentifierAssigner prefixedBy: 'unordered-list'