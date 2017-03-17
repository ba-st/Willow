initialize-release
initializeFor: aCallback requiring: anOptionalParameter

	callbackToEvaluate := aCallback.
	optionalClientSideParameter := anOptionalParameter.
	serverSideParameterBinding := Binding unboundBecause: 'Missing Server Side Parameter'