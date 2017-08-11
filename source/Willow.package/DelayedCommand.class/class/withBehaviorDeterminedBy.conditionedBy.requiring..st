private
withBehaviorDeterminedBy: aBlock conditionedBy: anOptionalClientCondition requiring: anOptionalParameter

	^ self new
		initializeWithBehaviorDeterminedBy: aBlock
		conditionedBy: anOptionalClientCondition
		requiring: anOptionalParameter