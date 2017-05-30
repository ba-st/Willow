private - utility
push: aWillowSession during: aBlockClosure

	self assert: CurrentWillowSession value == session.
	wasEvaluated := true