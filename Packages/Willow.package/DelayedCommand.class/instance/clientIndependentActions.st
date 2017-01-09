accessing
clientIndependentActions
	^ Array
		with: [ self resetInterpreter.
			serverSideParameterHolder withContentDo: [ :serverSideParameter | behaviorCallback value: self value: serverSideParameter ] ifUnused: [ behaviorCallback value: self ] ]