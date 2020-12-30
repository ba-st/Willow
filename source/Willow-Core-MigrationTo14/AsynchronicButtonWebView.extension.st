Extension { #name : #AsynchronicButtonWebView }

{ #category : #'*Willow-Core-MigrationTo14' }
AsynchronicButtonWebView >> onTrigger [

	self
		deprecated: 'Use #on instead.'
		transformWith: '`@receiver onTrigger' -> '`@receiver on trigger'.
	^ self on trigger
]
