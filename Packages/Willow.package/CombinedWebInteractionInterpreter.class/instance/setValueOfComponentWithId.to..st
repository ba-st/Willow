configuring
setValueOfComponentWithId: identifier to: aValueProvider

	self interpretersDo: [:interpreter |
		interpreter setValueOfComponentWithId: identifier to: aValueProvider]