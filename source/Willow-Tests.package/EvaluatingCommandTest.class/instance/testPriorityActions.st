tests-accessing
testPriorityActions

	"Priority actions are only created when a client parameter is provided.
	See #testClientIndependentActionsDependOnPriorityActionsWhenUsingClientParameter"

	self assert: (EvaluatingCommand for: [ self fail ]) priorityActions isEmpty