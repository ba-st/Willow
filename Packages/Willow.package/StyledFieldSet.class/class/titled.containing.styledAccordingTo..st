instance creation
titled: aTitle containing: aContentView styledAccordingTo: aCssStyle

	^self
		titled: aTitle
		containing: aContentView
		styledAccordingToAll: (Array with: aCssStyle)