Extension { #name : #TableWebView }

{ #category : #'*Willow-Core-MigrationTo14' }
TableWebView >> onTrigger [

	self
		deprecated: 'Use #on instead.'
		transformWith: '`@receiver onTrigger' -> '`@receiver on trigger'.
	^ self on trigger
]
