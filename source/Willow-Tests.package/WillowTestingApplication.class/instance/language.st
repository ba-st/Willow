Accessing
language

	^ [ super language ]
		on: WARequestContextNotFound
		do: [ :ex | ex return: (WALocale fromString: 'en') ]