instance creation
removing: aCssStyle fromComponentsMatching: aComponentProvider
	^ ServerIndependentComponentStyleClassChangingCommand
		altering: aCssStyle
		sending: #removeClass:
		toComponentFoundWith: aComponentProvider