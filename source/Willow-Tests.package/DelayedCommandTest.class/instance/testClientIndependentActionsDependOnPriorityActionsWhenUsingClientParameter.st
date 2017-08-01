tests-accessing
testClientIndependentActionsDependOnPriorityActionsWhenUsingClientParameter

	| command |

	command := DelayedCommand
		withBehaviorDeterminedBy: [ :response :parameter | 'Test is <1s>' expandMacrosWith: parameter ]
		with: 'complete'.

	self
		should: [ command clientIndependentActions collect: #value ]
		raise: AssertionFailed
		withDescription: 'Missing Server Side Parameter'.

	command priorityActions do: [ :action | action value: self value: 'canvas' ].
	self
		assertCollection: (command clientIndependentActions collect: #value)
		equals: #('Test is complete')