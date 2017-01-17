configuring
addCssClass: aCssStyle toComponentsMatching: aComponentProvider

	self interpretersDo: [:interpreter |
		interpreter addCssClass: aCssStyle toComponentsMatching: aComponentProvider]