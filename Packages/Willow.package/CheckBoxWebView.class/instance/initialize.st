initialize-release
initialize

	super initialize.
	selectedBlock := [false].
	identifier := ''.
	interactionInterpreter := WebInteractionInterpreter
				forClickOnHiddenInputDependentComponent