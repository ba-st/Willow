accessing
interactiveInputItemNamed: aName interpretedBy: anInputInterpreter

	^ SemanticInput
		interpretedBy: anInputInterpreter
		interactingThrough: WebInteractionInterpreter forChangeInComponentValue
		applying: (SemanticPopup toDisplay: aName)