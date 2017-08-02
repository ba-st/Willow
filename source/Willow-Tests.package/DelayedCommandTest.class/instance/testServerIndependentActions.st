tests-accessing
testServerIndependentActions

	self
		assert: (DelayedCommand withBehaviorDeterminedBy: [ self fail ]) serverIndependentActions isEmpty