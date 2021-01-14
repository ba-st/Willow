Extension { #name : #CheckboxWebView }

{ #category : #'*Willow-Core-MigrationTo14' }
CheckboxWebView >> onTrigger [

	self
		deprecated: 'Use #on instead.'
		transformWith: '`@receiver onTrigger' -> '`@receiver on trigger'.
	^ self on trigger
]
