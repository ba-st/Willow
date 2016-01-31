instance creation
titledUsing: aTitleProvider displayingImageAt: anImageLocation styledAccordingToAll: aCssStyleCollection

	| commands |
	commands := OrderedCollection withAll: (aCssStyleCollection
						collect: [:style | self styleCommandFor: style]).
	commands add: (self titleCommandUsing: aTitleProvider).
	^self displayingImageAt: anImageLocation applying: commands