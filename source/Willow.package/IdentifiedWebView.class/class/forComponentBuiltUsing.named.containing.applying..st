instance creation
forComponentBuiltUsing: aComponentBuilder named: aName containing: aView applying: aComponentCommand

	^ self new
		initializeForComponentBuiltUsing: aComponentBuilder
		as: aName
		containing: aView
		applying: aComponentCommand asWebComponentCommand 