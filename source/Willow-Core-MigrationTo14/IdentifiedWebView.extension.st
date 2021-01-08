Extension { #name : #IdentifiedWebView }

{ #category : #'*Willow-Core-MigrationTo14' }
IdentifiedWebView >> onTrigger [

	self
		deprecated: 'Use #on instead.'
		transformWith: '`@receiver onTrigger' -> '`@receiver on trigger'.
	^ self on trigger
]
