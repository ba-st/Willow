instance creation
forSpanNamed: aName containing: aView

	^ self forComponentBuiltUsing: [ :canvas | canvas span ] named: aName containing: aView