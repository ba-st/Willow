instance creation
forComponentBuiltUsing: aComponentBuilder named: aName containing: aView

	^ self
		forComponentBuiltUsing: aComponentBuilder
		named: aName
		containing: aView
		applying: CompositeComponentCommand empty