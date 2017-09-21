instance creation
forFormNamed: aName containing: aView applying: aComponentCommand

	^ self
		forComponentBuiltUsing: [ :canvas | canvas form ]
		named: aName
		containing: aView
		applying: aComponentCommand