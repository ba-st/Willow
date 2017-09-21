instance creation
applying: aComponentCommand transformingWith: aTextCodec

	^ self new
		initializeApplying: aComponentCommand asWebComponentCommand + NumberInputModeCommand new
		transformingWith: aTextCodec