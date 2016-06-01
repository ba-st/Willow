accessing
interactiveCheckBoxDescribedBy: aDescription

	^ SemanticCheckbox
		labeled: aDescription
		interactingThrough: WebInteractionInterpreter forClickOnHiddenInputDependentComponent