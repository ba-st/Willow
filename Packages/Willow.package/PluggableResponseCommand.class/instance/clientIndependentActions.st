accessing
clientIndependentActions

	^ Array
		with: [ 
			self resetInterpreter.
			behaviorCallback value: self ]