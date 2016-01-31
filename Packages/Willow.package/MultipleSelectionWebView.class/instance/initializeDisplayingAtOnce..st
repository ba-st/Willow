initialize-release
initializeDisplayingAtOnce: aNumberOfElements

	super initialize.
	contentsBlock := [#()].
	identifier := ''.
	interactionInterpreter := WebInteractionInterpreter
				forChangeInHiddenInputDependentComponentValue.
	numberOfElementsToDisplay := aNumberOfElements