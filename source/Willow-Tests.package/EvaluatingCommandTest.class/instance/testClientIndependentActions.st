tests-accessing
testClientIndependentActions

	| command |

	command := EvaluatingCommand for: [ 'Test is complete' ].
	self
		assertCollection: (command clientIndependentActions collect: #value)
		equals: #('Test is complete')