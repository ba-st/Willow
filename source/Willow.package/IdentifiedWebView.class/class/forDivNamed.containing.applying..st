instance creation
forDivNamed: aName containing: aView applying: aComponentCommand

	^self
		forComponentBuiltUsing: [:canvas | canvas div]
		named: aName
		containing: aView
		applying: aComponentCommand