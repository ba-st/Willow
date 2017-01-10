accessing
clientIndependentActions

	^ Array with: [ serverSideParameterHolder withContentDo: [ :serverSideParameter | callbackToEvaluate value: serverSideParameter ] ifUnused: [ callbackToEvaluate value ] ]