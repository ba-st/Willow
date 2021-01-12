Extension { #name : #ContainerWebView }

{ #category : #'*Willow-Core-MigrationTo14' }
ContainerWebView >> onTrigger [

	self
		deprecated: 'Use #on instead.'
		transformWith: '`@receiver onTrigger' -> '`@receiver on trigger'.
	^ self on trigger
]

{ #category : #'*Willow-Core-MigrationTo14' }
ContainerWebView >> view [

	self
		deprecated: 'Use #renderableContent instead'
		transformWith: '`@receiver view' -> '`@receiver renderableContent'.
	^ self renderableContent
]
