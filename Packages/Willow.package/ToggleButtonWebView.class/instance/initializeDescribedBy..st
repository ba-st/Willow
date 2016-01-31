initialize-release
initializeDescribedBy: aDescription

	super initialize.
	isToggled := false.
	description := aDescription.
	interactionInterpreter := WebInteractionInterpreter forClickOnHiddenInputDependentComponent