Multiple Selection-API
chooseAllMatching: aMonadycBlock

	chosenElements := availableElements select: aMonadycBlock.
	self notifyInterested