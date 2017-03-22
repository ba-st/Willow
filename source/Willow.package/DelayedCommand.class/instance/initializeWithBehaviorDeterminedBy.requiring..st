initialize-release
initializeWithBehaviorDeterminedBy: aBlock requiring: anOptionalParameter

	behaviorCallback := aBlock.
	optionalClientSideParameter := anOptionalParameter.
	serverSideParameterBinding := Binding undefinedExplainedBy: 'Missing Server Side Parameter'.
	self resetInterpreter