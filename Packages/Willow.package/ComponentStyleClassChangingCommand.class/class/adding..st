instance creation
adding: aCssClassStyle
	^ ServerIndependentComponentStyleClassChangingCommand
		altering: aCssClassStyle
		sending: #addClass:
		toComponentFoundWith: [ :canvas | canvas jQuery this ]