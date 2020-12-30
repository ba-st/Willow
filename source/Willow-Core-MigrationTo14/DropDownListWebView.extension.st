Extension { #name : #DropDownListWebView }

{ #category : #'*Willow-Core-MigrationTo14' }
DropDownListWebView >> onTrigger [

	self
		deprecated: 'Use #on instead.'
		transformWith: '`@receiver onTrigger' -> '`@receiver on trigger'.
	^ self on trigger
]
