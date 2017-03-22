instance creation
withBehaviorDeterminedBy: aBlock with: aParameter

	^ self withBehaviorDeterminedBy: aBlock requiring: (Optional containing: aParameter)