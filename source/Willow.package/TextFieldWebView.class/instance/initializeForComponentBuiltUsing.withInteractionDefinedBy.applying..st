initialization
initializeForComponentBuiltUsing: aComponentBuilder withInteractionDefinedBy: anInteractionInterpreter applying: aComponentCommand

	componentBuilder := aComponentBuilder.
	interactionInterpreter := anInteractionInterpreter.
	commandToComponent := aComponentCommand.
	interested := Set new.
	identifierAssigner := IdentifierAssigner prefixedBy: 'text'.
	self changeContentsTo: ''