tests-accessing
testClientIndependentActions

	| command blockWasExecuted |

	blockWasExecuted := false.
	command := DelayedCommand
		withBehaviorDeterminedBy: [ :response | blockWasExecuted := true ].
	command clientIndependentActions do: #value.
	self assert: blockWasExecuted