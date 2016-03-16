initialize-release
initializeLabeledWithContentOf: aHolder applying: aComponentCommand

	labelHolder := aHolder.
	interactionInterpreter := WebInteractionInterpreter
		forClickOnHiddenInputDependentComponent.
	isChecked := false.
	componentCommand := aComponentCommand