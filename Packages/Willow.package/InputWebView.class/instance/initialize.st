initialize-release
initialize

	contentsBlock := [''].
	afterContentObtainingCommand := [:contents | ].
	propertyCommands := OrderedCollection new.
	identifier := ''.
	readOnly := false.
	interactionInterpreter := WebInteractionInterpreter
				forChangeInComponentValue