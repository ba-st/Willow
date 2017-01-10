instance creation
adding: aCssStyle

	^ self
		altering: aCssStyle
		sending: #addClass:
		toComponentFoundWith: [ :canvas | canvas jQuery this ]