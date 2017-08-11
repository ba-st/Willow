instance creation
withBehaviorDeterminedBy: aBlock executedOnlyWhen: aStringCondition with: aParameter

	^ self
		withBehaviorDeterminedBy: aBlock
		conditionedBy: (Optional containing: (aStringCondition expandMacrosWith: aParameter asJavascript))
		requiring: (Optional containing: aParameter)