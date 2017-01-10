instance creation
withBehaviorDeterminedBy: aBlock

	^ self
		withBehaviorDeterminedBy: aBlock
		requiring: (UnusedHolder explainedBy: 'Nyladic block expected')