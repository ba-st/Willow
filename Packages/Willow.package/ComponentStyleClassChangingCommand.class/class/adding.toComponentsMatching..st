instance creation
adding: aCssStyle toComponentsMatching: aComponentProvider
	^ ServerIndependentComponentStyleClassChangingCommand
		altering: aCssStyle
		sending: #addClass:
		toComponentFoundWith: aComponentProvider