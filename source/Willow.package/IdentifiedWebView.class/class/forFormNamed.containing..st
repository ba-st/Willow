instance creation
forFormNamed: aName containing: aView

	^ self
		forComponentBuiltUsing: [ :canvas | canvas form ]
		named: aName
		containing: aView