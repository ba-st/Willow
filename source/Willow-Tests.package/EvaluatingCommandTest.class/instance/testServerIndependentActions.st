tests-accessing
testServerIndependentActions

	self assert: (EvaluatingCommand for: [ self fail ]) serverIndependentActions isEmpty