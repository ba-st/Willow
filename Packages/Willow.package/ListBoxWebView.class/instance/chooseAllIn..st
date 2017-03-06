Multiple Selection-API
chooseAllIn: anElementCollection

	chosenElements := availableElements select: [ :anElement | anElementCollection includes: anElement ].
	self notifyInterested