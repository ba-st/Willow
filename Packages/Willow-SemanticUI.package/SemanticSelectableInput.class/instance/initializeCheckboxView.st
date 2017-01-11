initialize-release
initializeCheckboxView

	checkboxView := SemanticCheckbox
		unlabeledInteractingThrough: WebInteractionInterpreter forClickOnHiddenInputDependentComponent
		applying: self checkboxCommand.
	checkboxView setCheckTo: true.
	checkboxView onTrigger
		toggleCssClass: SemanticStyle for disabled
		onComponentsMatching: [ :canvas | canvas jQuery this parent next ]