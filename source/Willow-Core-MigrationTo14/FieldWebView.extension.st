Extension { #name : #FieldWebView }

{ #category : #'*Willow-Core-MigrationTo14' }
FieldWebView >> onTrigger [

	self
		deprecated: 'Use #on instead.'
		transformWith: '`@receiver onTrigger' -> '`@receiver on trigger'.
	^ self on trigger
]
