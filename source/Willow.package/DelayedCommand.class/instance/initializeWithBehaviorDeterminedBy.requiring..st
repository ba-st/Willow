initialize-release
initializeWithBehaviorDeterminedBy: aBlock requiring: anOptionalParameter

	behaviorCallback := aBlock.
	optionalClientSideParameter := anOptionalParameter.
	serverSideParameterBinding := Binding unboundBecause: 'Missing Server Side Parameter'.
	self resetInterpreter