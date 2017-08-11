Configuring
setValueTo: aValueProvider thenTriggerChangeOf: anIdentifiedView

	self
		interpretersDo: [ :interpreter | 
			interpreter
				setValueTo: aValueProvider
				thenTriggerChangeOf: anIdentifiedView ]