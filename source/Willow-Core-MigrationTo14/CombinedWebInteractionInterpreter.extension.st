Extension { #name : #CombinedWebInteractionInterpreter }

{ #category : #'*Willow-Core-MigrationTo14' }
CombinedWebInteractionInterpreter class >> combiningInterpretersOf: aWebViewCollection [

	self
		deprecated: 'Use a CombinedEventInterpreterDispatcher instead'
		transformWith:
			' CombinedWebInteractionInterpreter combiningInterpretersOf: `@aWebViewCollection'
				-> 'CombinedEventInterpreterDispatcher combiningInterpretersOfAll: `@aWebViewCollection'.
	^ CombinedEventInterpreterDispatcher combiningInterpretersOfAll: aWebViewCollection
]
