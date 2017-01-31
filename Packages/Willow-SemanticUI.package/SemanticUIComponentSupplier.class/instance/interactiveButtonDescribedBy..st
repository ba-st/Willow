accessing
interactiveButtonDescribedBy: aString

	^ SemanticButton
		labeled: aString
		interactingThrough: WebInteractionInterpreter forClickOnComponent
		applying: CompositeComponentCommand empty