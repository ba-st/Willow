instance creation
withBehaviorDeterminedBy: aBlock with: aParameter

	^ self withBehaviorDeterminedBy: aBlock requiring: (Holder containing: aParameter)