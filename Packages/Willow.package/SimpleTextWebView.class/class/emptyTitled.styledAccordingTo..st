instance creation
emptyTitled: aTitle styledAccordingTo: aCssStyle

	^self obtainingContentFrom: []
		applying: (OrderedCollection with: (self titleCommandUsing: [aTitle])
				with: (self styleCommandFor: aCssStyle))