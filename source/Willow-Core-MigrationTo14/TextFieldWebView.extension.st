Extension { #name : #TextFieldWebView }

{ #category : #'*Willow-Core-MigrationTo14' }
TextFieldWebView class >> multiLineTriggeringOnChangeApplying: aComponentCommand [

	self
		deprecated: 'Use #multiLineApplying: instead.'
		transformWith:
			'`@receiver multiLineTriggeringOnChangeApplying: `@aComponentCommand'
				-> '`@receiver multiLineApplying: `@aComponentCommand'.
	^ self multiLineApplying: aComponentCommand
]

{ #category : #'*Willow-Core-MigrationTo14' }
TextFieldWebView class >> multiLineTriggeringOnKeyUpApplying: aComponentCommand [

	self deprecated: 'Use #multiLineApplying: then configure on keyUp instead of on trigger.'.
	^ self multiLineApplying: aComponentCommand
]

{ #category : #'*Willow-Core-MigrationTo14' }
TextFieldWebView class >> singleLineTriggeringOnChangeApplying: aComponentCommand [

	self
		deprecated: 'Use #singleLineApplying: instead.'
		transformWith:
			'`@receiver singleLineTriggeringOnChangeApplying: `@aComponentCommand'
				-> '`@receiver singleLineApplying: `@aComponentCommand'.
	^ self singleLineApplying: aComponentCommand
]

{ #category : #'*Willow-Core-MigrationTo14' }
TextFieldWebView class >> singleLineTriggeringOnKeyUpApplying: aComponentCommand [

	self deprecated: 'Use #singleLineApplying: then configure on keyUp instead of on trigger.'.
	^ self singleLineApplying: aComponentCommand
]
