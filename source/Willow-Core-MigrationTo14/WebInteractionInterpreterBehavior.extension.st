Extension { #name : #WebInteractionInterpreterBehavior }

{ #category : #'*Willow-Core-MigrationTo14' }
WebInteractionInterpreterBehavior >> determineBehaviorByEvaluating: aCallbackBlock [

	self
		deprecated: 'Use #serverDo: instead.'
		transformWith:
			'`@receiver determineBehaviorByEvaluating: `@aCallbackBlock'
				-> '`@receiver serverDo: `@aCallbackBlock'.
	self serverDo: aCallbackBlock
]

{ #category : #'*Willow-Core-MigrationTo14' }
WebInteractionInterpreterBehavior >> determineBehaviorByEvaluating: aCallbackBlock with: aParameter [

	self
		deprecated:
			'Use #serverDo:with: instead, remembering to: (1) rename the first argument in the block to `:request`, (2) remove the second argument (the parameter), (3) access the parameter by sending `request parameter` instead of using the second argument in the block.'.
	self
		serverDo: [ :request | aCallbackBlock value: request value: request parameter ]
		with: aParameter
]

{ #category : #'*Willow-Core-MigrationTo14' }
WebInteractionInterpreterBehavior >> evaluate: aCallbackBlock [

	self
		deprecated: 'Use #serverDo: instead.'
		transformWith: '`@receiver evaluate: `@aCallbackBlock' -> '`@receiver serverDo: `@aCallbackBlock'.
	self serverDo: aCallbackBlock
]

{ #category : #'*Willow-Core-MigrationTo14' }
WebInteractionInterpreterBehavior >> evaluate: aCallbackBlock with: aParameter [

	self
		deprecated:
			'Use #serverDo:with: instead, remembering to: (1) remove the argument in the block (the parameter), (2) add instead an argument named `:request`, (3) access the parameter by sending `request parameter` instead.'.
	self serverDo: [ :request | aCallbackBlock value: request parameter ] with: aParameter
]

{ #category : #'*Willow-Core-MigrationTo14' }
WebInteractionInterpreterBehavior >> executeOnClient: aServerIndependentAction [

	self
		deprecated: 'Use #userAgentDo: instead.'
		transformWith:
			'`@receiver executeOnClient: `@aServerIndependentAction'
				-> '`@receiver userAgentDo: `@aServerIndependentAction'.
	self userAgentDo: aServerIndependentAction
]

{ #category : #'*Willow-Core-MigrationTo14' }
WebInteractionInterpreterBehavior >> onlyWhen: aStringCondition determineBehaviorByEvaluating: aCallbackBlock with: aParameter [

	self
		deprecated:
			'Use #onlyWhen:serverDo:with: instead, remembering to: (1) rename the first argument in the block to `:request`, (2) remove the second argument (the parameter), (3) access the parameter by sending `request parameter` instead of using the second argument in the block.'.
	self
		onlyWhen: aStringCondition
		serverDo: [ :request | aCallbackBlock value: request value: request parameter ]
		with: aParameter
]
