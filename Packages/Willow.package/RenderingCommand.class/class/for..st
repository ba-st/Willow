instance creation
for: anIdentifiedView

	anIdentifiedView isNil
		ifTrue: [ Error signal: 'View initialization order is incorrect, please review' ].
	^ self new initializeFor: anIdentifiedView