Extension { #name : #ServerResponseCommand }

{ #category : #'*Willow-Core-MigrationTo14' }
ServerResponseCommand >> onReturn [

	self
		deprecated: 'Use #onRespond instead.'
		transformWith: '`@receiver onReturn' -> '`@receiver onRespond'.
	^ self onRespond
]
