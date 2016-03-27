instance creation
removing: aCssStyle fromComponentFoundWith: aComponentProvider

	^ self altering: aCssStyle sending: #removeClass: toComponentFoundWith: aComponentProvider