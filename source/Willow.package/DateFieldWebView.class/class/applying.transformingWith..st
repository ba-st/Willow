instance creation
applying: aComponentCommand transformingWith: aTextCodec

	^ self new initializeApplying: [ :field | field beDateInput + aComponentCommand ] asWebComponentCommand transformingWith: aTextCodec