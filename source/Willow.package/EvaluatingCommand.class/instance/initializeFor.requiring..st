initialization
initializeFor: aCallback requiring: anOptionalParameter

	callbackToEvaluate := aCallback.
	optionalClientSideParameter := anOptionalParameter.
	serverSideParameterBinding := Binding undefinedExplainedBy: 'Missing Server Side Parameter'