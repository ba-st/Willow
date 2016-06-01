accessing
simpleInput

	^ SemanticInput
		interpretedBy: InputInterpreter forText
		interactingThrough: NullWebInteractionInterpreter new
		applying: ComponentCommandBehavior nullCommand