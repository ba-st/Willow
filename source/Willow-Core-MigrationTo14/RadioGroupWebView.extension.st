Extension { #name : #RadioGroupWebView }

{ #category : #'*Willow-Core-MigrationTo14' }
RadioGroupWebView >> onTrigger [

	self
		deprecated: 'Use #on instead.'
		transformWith: '`@receiver onTrigger' -> '`@receiver on trigger'.
	^ self on trigger
]
