accessing
simpleInput

	^ SemanticInput
		interpretedBy: InputInterpreter forText
		interactingThrough:
			(WebInteractionInterpreter
				workingWith: WebComponentInteraction neverTriggered)
		applying: CompositeComponentCommand empty