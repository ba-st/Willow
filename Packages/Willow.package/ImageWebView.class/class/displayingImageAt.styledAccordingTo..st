instance creation
displayingImageAt: anImageLocation styledAccordingTo: aCssStyle

	^self displayingImageAt: anImageLocation
		applying: (OrderedCollection with: (self styleCommandFor: aCssStyle))