Extension { #name : #SynchronicSubmitButtonWebView }

{ #category : #'*Willow-Core-MigrationTo14' }
SynchronicSubmitButtonWebView >> onTrigger [

	self
		deprecated: 'Use #on instead.'
		transformWith: '`@receiver onTrigger' -> '`@receiver on trigger'.
	^ self on trigger
]
