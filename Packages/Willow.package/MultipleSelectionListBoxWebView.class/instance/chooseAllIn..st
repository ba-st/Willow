Multiple Selection-API
chooseAllIn: anElementCollection

	self chooseAllMatching: [ :available | anElementCollection includes: available ]