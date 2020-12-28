Extension { #name : #GenericContainerWebView }

{ #category : #'*Willow-Core-MigrationTo14' }
GenericContainerWebView >> onTrigger [

	self
		deprecated: 'Use #on instead.'
		transformWith: '`@receiver onTrigger' -> '`@receiver on trigger'.
	^ self on trigger
]
