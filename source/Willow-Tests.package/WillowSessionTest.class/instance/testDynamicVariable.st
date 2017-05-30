tests
testDynamicVariable

	wasEvaluated := false.
	session := WillowSession new.
	session handle: self.

	self assert: wasEvaluated