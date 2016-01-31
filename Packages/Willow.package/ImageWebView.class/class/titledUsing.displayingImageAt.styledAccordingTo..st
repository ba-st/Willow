instance creation
titledUsing: aTitleProvider displayingImageAt: anImageLocation styledAccordingTo: aCssStyle

	^self
		titledUsing: aTitleProvider
		displayingImageAt: anImageLocation
		styledAccordingToAll: (Array with: aCssStyle)