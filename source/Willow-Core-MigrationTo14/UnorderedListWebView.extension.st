Extension { #name : #UnorderedListWebView }

{ #category : #'*Willow-Core-MigrationTo14' }
UnorderedListWebView >> onTrigger [

	self
		deprecated: 'Use #on instead.'
		transformWith: '`@receiver onTrigger' -> '`@receiver on trigger'.
	^ self on trigger
]
