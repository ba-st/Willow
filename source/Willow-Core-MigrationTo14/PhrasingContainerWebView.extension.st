Extension { #name : #PhrasingContainerWebView }

{ #category : #'*Willow-Core-MigrationTo14' }
PhrasingContainerWebView >> onTrigger [

	self
		deprecated: 'Use #on instead.'
		transformWith: '`@receiver onTrigger' -> '`@receiver on trigger'.
	^ self on trigger
]
