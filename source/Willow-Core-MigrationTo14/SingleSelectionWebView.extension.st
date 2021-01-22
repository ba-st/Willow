Extension { #name : #SingleSelectionWebView }

{ #category : #'*Willow-Core-MigrationTo14' }
SingleSelectionWebView >> onTrigger [

	self
		deprecated: 'Use #on instead.'
		transformWith: '`@receiver onTrigger' -> '`@receiver on trigger'.
	^ self on trigger
]
