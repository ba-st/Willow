configuring
setValueTo: aValueProvider withoutTriggeringChangeOComponentWithId: identifier

	self
		interpretersDo: [ :interpreter | 
			interpreter
				setValueTo: aValueProvider
				withoutTriggeringChangeOComponentWithId: identifier ]