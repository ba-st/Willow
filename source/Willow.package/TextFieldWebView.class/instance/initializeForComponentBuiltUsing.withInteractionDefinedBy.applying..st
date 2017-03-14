initialization
initializeForComponentBuiltUsing: aComponentBuilder withInteractionDefinedBy: anInteractionInterpreter applying: aComponentCommand

	componentBuilder := aComponentBuilder.
	interactionInterpreter := anInteractionInterpreter.
	commandToComponent := aComponentCommand.
	interested := Set new.
	identifierHolder := UnusedHolder explainedBy: 'Identifier never requested so far'.
	self changeContentsTo: ''