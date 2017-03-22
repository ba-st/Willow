initialize-release
initializeForComponentBuiltUsing: aComponentBuilder as: anIdentificationPrefix containing: aView applying: aComponentCommand

	view := aView.
	componentBuilder := aComponentBuilder.
	commandToComponent := aComponentCommand.
	identifierAssigner := IdentifierAssigner prefixedBy: anIdentificationPrefix