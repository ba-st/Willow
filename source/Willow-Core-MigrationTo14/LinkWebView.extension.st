Extension { #name : #LinkWebView }

{ #category : #'*Willow-Core-MigrationTo14' }
LinkWebView >> onTrigger [

	self
		deprecated: 'Use #on instead.'
		transformWith: '`@receiver onTrigger' -> '`@receiver on trigger'.
	^ self on trigger
]
