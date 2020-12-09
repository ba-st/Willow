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
			'Use #with:serverDo: instead, remembering to: (1) rename the first argument in the block to `:request`, (2) remove the second argument (the parameter), (3) access the parameter by sending `request parameter` instead of using the second argument in the block.'.
	self
		with: aParameter
		serverDo: [ :request | aCallbackBlock value: request value: request parameter ]
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
			'Use #with:serverDo: instead, remembering to: (1) remove the argument in the block (the parameter), (2) add instead an argument named `:request`, (3) access the parameter by sending `request parameter` instead.'.
	self with: aParameter serverDo: [ :request | aCallbackBlock value: request parameter ]
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
			'Use #with:onlyWhen:serverDo: instead, remembering to: (1) change the condition to a block optionally receiving the user agent javascript parameter as an argument, returning a javascript boolean condition, (2) rename the first argument in the block to `:request`, (3) remove the second argument (the parameter), (4) access the parameter by sending `request parameter` instead of using the second argument in the block.'.
	self
		with: aParameter
		onlyWhen: [ :parameter | JSStream on: aStringCondition ]
		serverDo: [ :request | aCallbackBlock value: request value: request parameter ]
]
