Extension { #name : #WebInteractionInterpreter }

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
WebInteractionInterpreter class >> forClickOnComponent [

	self
		deprecated: 'Use an EventInterpreterDispatcher'
		transformWith: 'WebInteractionInterpreter forClickOnComponent' -> 'EventInterpreterDispatcher defaultingToClick'.

	^ EventInterpreterDispatcher defaultingToClick
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
