instance creation
applying: aComponentCommand transformingWith: aTextCodec

	^ self new initializeApplying: [ :field | field beNumberInput + aComponentCommand ] asWebComponentCommand transformingWith: aTextCodec