instance creation
referringTo: aView as: aName

	^self new
		initializeReferringTo: aView
		as: aName
		obtainingContainerComponentFrom: [:canvas | canvas div]