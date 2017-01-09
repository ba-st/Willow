instance creation
toggling: aCssStyle onComponentsMatching: aComponentProvider
	^ ServerIndependentComponentStyleClassChangingCommand
		altering: aCssStyle
		sending: #toggleClass:
		toComponentFoundWith: aComponentProvider