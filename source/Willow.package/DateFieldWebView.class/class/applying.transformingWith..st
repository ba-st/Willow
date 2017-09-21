instance creation
applying: aComponentCommand transformingWith: aTextCodec

	^ self new
		initializeApplying: aComponentCommand asWebComponentCommand + DateInputModeCommand new
		transformingWith: aTextCodec