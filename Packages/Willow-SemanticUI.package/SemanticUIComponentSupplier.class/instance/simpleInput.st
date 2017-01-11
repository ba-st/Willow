accessing
simpleInput

	^ SemanticInput
		interpretedBy: InputInterpreter forText
		interactingThrough: NullWebInteractionInterpreter new
		applying: WebComponentCommand nullCommand