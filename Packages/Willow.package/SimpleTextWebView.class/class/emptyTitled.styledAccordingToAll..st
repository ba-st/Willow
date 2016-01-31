instance creation
emptyTitled: aTitle styledAccordingToAll: aCssStyleCollection

	^ self
		obtainingContentFrom: [  ]
		applying:
			(OrderedCollection
				with: (self titleCommandUsing: [ aTitle ])
				with: (self styleCommandForAll: aCssStyleCollection))