accessing
clientIndependentActions

	^ Array
		with: [ self resetInterpreter.
			optionalClientSideParameter withContentDo: [ :x | behaviorCallback value: self value: serverSideParameterBinding content ] ifUnused: [ behaviorCallback value: self ] ]