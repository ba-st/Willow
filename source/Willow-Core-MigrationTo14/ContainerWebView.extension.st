Extension { #name : #ContainerWebView }

{ #category : #'*Willow-Core-MigrationTo14' }
ContainerWebView >> onTrigger [

	self
		deprecated: 'Use #on instead.'
		transformWith: '`@receiver onTrigger' -> '`@receiver on trigger'.
	^ self on trigger
]
