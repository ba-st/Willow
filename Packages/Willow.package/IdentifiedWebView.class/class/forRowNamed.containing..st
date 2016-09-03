instance creation
forRowNamed: aName containing: aView

	^ self
		forComponentBuiltUsing: [ :canvas | canvas tableRow ]
		named: aName
		containing: aView