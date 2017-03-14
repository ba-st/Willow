instance creation
applying: aComponentCommand listing: anElementCollection applyingToEach: anElementCommand

	^ self new
		initializeApplying: aComponentCommand
		listing: anElementCollection
		applyingToEach: anElementCommand