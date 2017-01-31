initialize-release
initializeWithInteractionDefinedBy: aUserInteractionPolicy applying: aComponentCommand

	self obtainContentsFrom: [ #() ].
	identifier := ''.
	interactionInterpreter := aUserInteractionPolicy.
	commandToComponent := aComponentCommand