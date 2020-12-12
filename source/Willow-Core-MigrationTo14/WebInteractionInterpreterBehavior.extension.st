Extension { #name : #WebInteractionInterpreterBehavior }

{ #category : #'*Willow-Core-MigrationTo14' }
WebInteractionInterpreterBehavior >> addCssClass: aCssStyle [

	self
		deprecated: 'use updateCssClasses: instead'
		transformWith:
			'`@receiver addCssClass: `@aCssStyle'
				->
					'`@receiver updateCssClasses:
						[ :classes | classes addClass: `@aCssStyle ]'.
	self updateCssClasses: [ :classes | classes addClass: aCssStyle ]
]

{ #category : #'*Willow-Core-MigrationTo14' }
WebInteractionInterpreterBehavior >> addCssClass: aCssStyle toComponentsMatching: aComponentProvider [

	self
		deprecated: 'use updateCssClasses:onElementsMatching: instead'
		transformWith:
			'`@receiver addCssClass: `@aCssStyle toComponentsMatching: `@aComponentProvider'
				->
					'`@receiver
		updateCssClasses: [ :classes | classes addClass: `@aCssStyle ]
		onElementsMatching: `@aComponentProvider'.
	self
		updateCssClasses: [ :classes | classes addClass: aCssStyle ]
		onElementsMatching: aComponentProvider
]

{ #category : #'*Willow-Core-MigrationTo14' }
WebInteractionInterpreterBehavior >> changeCssClass: anExistingStyle to: aNewStyle [

	self
		deprecated: 'use updateCssClasses:onElementsMatching: instead'
		transformWith:
			'`@receiver changeCssClass: `@anExistingStyle to: `@aNewStyle'
				->
					'`@receiver
		updateCssClasses: [ :classes | classes removeClass: `@anExistingStyle; addClass: `@aNewStyle ]
		onElementsMatching: [ :canvas | canvas jQuery class: `@anExistingStyle ]'.
	self
		updateCssClasses: [ :classes | 
			classes
				removeClass: anExistingStyle;
				addClass: aNewStyle
			]
		onElementsMatching: [ :canvas | canvas jQuery class: anExistingStyle ]
]

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

{ #category : #'*Willow-Core-MigrationTo14' }
WebInteractionInterpreterBehavior >> removeCssClass: aCssStyle fromComponentsMatching: aComponentProvider [

	self
		deprecated: 'use updateCssClasses:onElementsMatching: instead'
		transformWith:
			'`@receiver removeCssClass: `@aCssStyle fromComponentsMatching: `@aComponentProvider'
				->
					'`@receiver
		updateCssClasses: [ :classes | classes removeClass: `@aCssStyle ]
		onElementsMatching: `@aComponentProvider'.
	self
		updateCssClasses: [ :classes | classes removeClass: aCssStyle ]
		onElementsMatching: aComponentProvider
]

{ #category : #'*Willow-Core-MigrationTo14' }
WebInteractionInterpreterBehavior >> removeCssClass: aCssStyle fromComponentsWithClass: aComponentByStyleName [

	self
		deprecated: 'use updateCssClasses:onElementsMatching: instead'
		transformWith:
			'`@receiver removeCssClass: `@aCssStyle fromComponentsWithClass: `@aComponentByStyleName'
				->
					'`@receiver
		updateCssClasses: [ :classes | classes removeClass: `@aCssStyle ]
		onElementsMatching: [ :canvas | canvas jQuery class: `@aComponentByStyleName ]'.
	self
		updateCssClasses: [ :classes | classes removeClass: aCssStyle ]
		onElementsMatching: [ :canvas | canvas jQuery class: aComponentByStyleName ]
]

{ #category : #'*Willow-Core-MigrationTo14' }
WebInteractionInterpreterBehavior >> toggleCssClass: aCssStyle [

	self
		deprecated: 'use updateCssClasses:onElementsMatching: instead'
		transformWith:
			'`@receiver toggleCssClass: `@aCssStyle'
				->
					'`@receiver
		updateCssClasses: [ :classes | classes toggleClass: `@aCssStyle ]
		onElementsMatching: [ :canvas | canvas jQuery this ]'.
	self
		updateCssClasses: [ :classes | classes toggleClass: aCssStyle ]
		onElementsMatching: [ :canvas | canvas jQuery this ]
]

{ #category : #'*Willow-Core-MigrationTo14' }
WebInteractionInterpreterBehavior >> toggleCssClass: aCssStyle on: anIdentifiedWebView [

	self
		deprecated: 'use updateCssClasses:onElementsMatching: instead'
		transformWith:
			'`@receiver toggleCssClass: `@aCssStyle on: `@anIdentifiedWebView'
				->
					'`@receiver
		updateCssClasses: [ :classes | classes toggleClass: `@aCssStyle ]
		onElementsMatching: [ :canvas | 
			[ `@anIdentifiedWebView identifier ]
				on: AssertionFailed
				do: [ :ex | ex return: ( `@anIdentifiedWebView identifyIn: canvas ) ].
			canvas jQuery id: `@anIdentifiedWebView identifier
			]'.
	self
		updateCssClasses: [ :classes | classes toggleClass: aCssStyle ]
		onElementsMatching: [ :canvas | 
			[ anIdentifiedWebView identifier ]
				on: AssertionFailed
				do: [ :ex | ex return: ( anIdentifiedWebView identifyIn: canvas ) ].
			canvas jQuery id: anIdentifiedWebView identifier
			]
]

{ #category : #'*Willow-Core-MigrationTo14' }
WebInteractionInterpreterBehavior >> toggleCssClass: aCssStyle onComponentsMatching: aComponentProvider [

	self
		deprecated: 'use updateCssClasses:onElementsMatching: instead'
		transformWith:
			'`@receiver toggleCssClass: `@aCssStyle onComponentsMatching: `@aComponentProvider'
				->
					'`@receiver
		updateCssClasses: [ :classes | classes toggleClass: `@aCssStyle ]
		onElementsMatching: `@aComponentProvider'.
	self
		updateCssClasses: [ :classes | classes toggleClass: aCssStyle ]
		onElementsMatching: aComponentProvider
]
