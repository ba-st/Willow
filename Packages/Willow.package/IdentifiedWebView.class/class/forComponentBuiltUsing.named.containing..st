instance creation
forComponentBuiltUsing: aComponentBuilder named: aName containing: aView

	^ self new
		initializeForComponentBuiltUsing: aComponentBuilder
		named: aName
		containing: aView