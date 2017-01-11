initialize-release
initializeForComponentBuiltUsing: aComponentBuilder as: anIdentificationPrefix containing: aView applying: aComponentCommand

	view := aView.
	identificationPrefix := anIdentificationPrefix.
	componentBuilder := aComponentBuilder.
	commandToComponent := aComponentCommand.
	identifierHolder := UnusedHolder explainedBy: 'Identifier never requested so far'