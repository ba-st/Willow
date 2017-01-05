initialize-release
initializeDisplayingAtOnce: aNumberOfElements

	contentsBlock := [#()].
	identifier := ''.
	interactionInterpreter := WebInteractionInterpreter
				forChangeInHiddenInputDependentComponentValue.
	numberOfElementsToDisplay := aNumberOfElements