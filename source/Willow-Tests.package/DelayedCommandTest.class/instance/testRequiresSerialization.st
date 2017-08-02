tests-testing
testRequiresSerialization

	self
		assert: (DelayedCommand withBehaviorDeterminedBy: [ self fail ]) requiresSerialization