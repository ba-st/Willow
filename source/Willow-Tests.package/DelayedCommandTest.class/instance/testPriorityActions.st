tests-accessing
testPriorityActions

	"Priority actions are only created when a client parameter is provided.
	See #testClientIndependentActionsDependOnPriorityActionsWhenUsingClientParameter"

	self
		assert:
			(DelayedCommand withBehaviorDeterminedBy: [ :response | self fail ]) priorityActions
				isEmpty