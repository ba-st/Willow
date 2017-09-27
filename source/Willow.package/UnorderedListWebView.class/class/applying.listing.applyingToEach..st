instance creation
applying: aComponentCommand listing: anElementCollection applyingToEach: anElementCommand

	^ self new
		initializeApplying: aComponentCommand asWebComponentCommand
		listing: anElementCollection
		applyingToEach: anElementCommand asWebComponentCommand