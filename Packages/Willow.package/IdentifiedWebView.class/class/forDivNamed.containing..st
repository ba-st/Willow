instance creation
forDivNamed: aName containing: aView

	^ self forComponentBuiltUsing: [ :canvas | canvas div ] named: aName containing: aView