instance creation
applying: aCommandToComponent forEachButtonUse: aDefinition applying: aCommandToRadioButton

	^ self new
		initializeApplying: aCommandToComponent
		forEachButtonUse: aDefinition
		applying: aCommandToRadioButton