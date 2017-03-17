accessing
clientIndependentActions

	^ Array with: [ optionalClientSideParameter withContentDo: [ :x | callbackToEvaluate value: serverSideParameterBinding content ] ifUnused: callbackToEvaluate ]