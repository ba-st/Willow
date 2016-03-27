initialize-release
initializeCheckboxView

	checkboxView := SemanticCheckbox unlabeledApplying: self checkboxCommand.
	checkboxView setCheckTo: true.
	checkboxView onTrigger
		toggle: SemanticStyle for disabled
		onComponentFoundWith: [ :canvas | canvas jQuery this parent next ]