tests-accessing
testModelLoadingActions

	self assert: (EvaluatingCommand for: [ self fail ]) modelLoadingActions isEmpty