instance creation
referringToRowContaining: aView as: aName

	^self new
		initializeReferringTo: aView
		as: aName
		obtainingContainerComponentFrom: [:canvas | canvas tableRow]