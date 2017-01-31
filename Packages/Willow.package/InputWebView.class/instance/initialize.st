initialize-release
initialize

	contentsBlock := [ '' ].
	afterContentObtainingCommand := [ :contents |  ].
	commandToComponent := CompositeComponentCommand empty.
	identifier := ''.
	readOnly := false.
	interactionInterpreter := WebInteractionInterpreter forChangeInComponentValue