tests-accessing
testClientIndependentActionsDependOnPriorityActionsWhenUsingClientParameter

	| command |

	command := EvaluatingCommand for: [ :parameter | 'Test is <1s>' expandMacrosWith: parameter ] with: 'complete'.

	self
		should: [ command clientIndependentActions collect: #value ]
		raise: AssertionFailed
		withExceptionDo: [ :error | self assert: error messageText equals: 'Missing Server Side Parameter' ].

	command priorityActions do: [ :action | action value: self value: 'canvas' ].
	self assertCollection: (command clientIndependentActions collect: #value) equals: #('Test is complete')