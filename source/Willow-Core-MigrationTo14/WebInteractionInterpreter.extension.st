Extension { #name : #WebInteractionInterpreter }

{ #category : #'*Willow-Core-MigrationTo14' }
WebInteractionInterpreter class >> combiningInterpretersOf: aWebViewCollection [

	self
		deprecated: 'Use a CombinedEventInterpreterDispatcher instead'
		transformWith:
			' CombinedWebInteractionInterpreter combiningInterpretersOf: `@aWebViewCollection'
				-> 'CombinedEventInterpreterDispatcher combiningInterpretersOfAll: `@aWebViewCollection'.
	^ CombinedEventInterpreterDispatcher combiningInterpretersOfAll: aWebViewCollection
]

{ #category : #'*Willow-Core-MigrationTo14' }
WebInteractionInterpreter class >> forChangeInComponentValue [

	self
		deprecated: 'Use an EventInterpreterDispatcher'
		transformWith:
			'WebInteractionInterpreter forChangeInComponentValue'
				-> 'EventInterpreterDispatcher defaultingToChange'.

	^ EventInterpreterDispatcher defaultingToChange
]

{ #category : #'*Willow-Core-MigrationTo14' }
WebInteractionInterpreter class >> forChangeInHiddenInputDependentComponentValue [

	self
		deprecated: 'Use an EventInterpreterDispatcher'
		transformWith:
			'WebInteractionInterpreter forChangeInHiddenInputDependentComponentValue'
				-> 'EventInterpreterDispatcher defaultingToChangeHidden'.

	^ EventInterpreterDispatcher defaultingToChangeHidden
]

{ #category : #'*Willow-Core-MigrationTo14' }
WebInteractionInterpreter class >> forClickOnComponent [

	self
		deprecated: 'Use an EventInterpreterDispatcher'
		transformWith: 'WebInteractionInterpreter forClickOnComponent' -> 'EventInterpreterDispatcher defaultingToClick'.

	^ EventInterpreterDispatcher defaultingToClick
]

{ #category : #'*Willow-Core-MigrationTo14' }
WebInteractionInterpreter class >> forClickOnHiddenInputDependentComponent [

	self
		deprecated: 'Use an EventInterpreterDispatcher'
		transformWith:
			'WebInteractionInterpreter forClickOnHiddenInputDependentComponent'
				-> 'EventInterpreterDispatcher defaultingToClickHidden'.

	^ EventInterpreterDispatcher defaultingToClickHidden
]

{ #category : #'*Willow-Core-MigrationTo14' }
WebInteractionInterpreter class >> forDelayedModelLoading [

	self
		deprecated: 'Should not be used outside ServerResponseCommand>>#resetInterpreter'
		transformWith: '`@receiver forDelayedModelLoading' -> '`@receiver workingWith: DelayedModelLoader new'.

	^ self workingWith: DelayedModelLoader new
]

{ #category : #'*Willow-Core-MigrationTo14' }
WebInteractionInterpreter class >> forReleaseOfKeyInComponent [

	self
		deprecated: 'Use an EventInterpreterDispatcher'
		transformWith:
			'WebInteractionInterpreter forReleaseOfKeyInComponent'
				-> 'EventInterpreterDispatcher defaultingToKeyUp'.

	^ EventInterpreterDispatcher defaultingToKeyUp
]
