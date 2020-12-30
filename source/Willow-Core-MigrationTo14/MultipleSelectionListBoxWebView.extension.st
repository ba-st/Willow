Extension { #name : #MultipleSelectionListBoxWebView }

{ #category : #'*Willow-Core-MigrationTo14' }
MultipleSelectionListBoxWebView >> onTrigger [

	self
		deprecated: 'Use #on instead.'
		transformWith: '`@receiver onTrigger' -> '`@receiver on trigger'.
	^ self on trigger
]
