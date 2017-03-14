instance creation
triggeringChangesObtainingIdentifierFrom: anIdentifierProvider valueFrom: aValueProvider

	^ self obtainingIdentifierFrom: aValueProvider valueFrom: anIdentifierProvider triggeringAction: [ :jQueryInstance | jQueryInstance trigger: 'change' ]