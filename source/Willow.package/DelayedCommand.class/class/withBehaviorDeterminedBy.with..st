instance creation
withBehaviorDeterminedBy: aBlock with: aParameter

	^ self
		withBehaviorDeterminedBy: aBlock
		conditionedBy: Optional unused
		requiring: (Optional containing: aParameter)