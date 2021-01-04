Extension { #name : #ImageWebView }

{ #category : #'*Willow-Core-MigrationTo14' }
ImageWebView >> onTrigger [

	self
		deprecated: 'Use #on instead.'
		transformWith: '`@receiver onTrigger' -> '`@receiver on trigger'.
	^ self on trigger
]
