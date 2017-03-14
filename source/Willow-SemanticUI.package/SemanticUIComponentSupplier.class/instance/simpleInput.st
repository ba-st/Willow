accessing
simpleInput

	^ SemanticInput
		interpretedBy: NullCodec new
		interactingThrough:
			(WebInteractionInterpreter
				workingWith: WebComponentInteraction neverTriggered)
		applying: CompositeComponentCommand empty