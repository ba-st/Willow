accessing
clientIndependentActions

	^ Array with: [ optionalClientSideParameter withContentDo: [ callbackToEvaluate value: serverSideParameterBinding content ] ifUnused: callbackToEvaluate ]