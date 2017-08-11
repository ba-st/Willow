initialization
initializeWithBehaviorDeterminedBy: aBlock conditionedBy: anOptionalClientCondition requiring: anOptionalParameter

	behaviorCallback := aBlock.
	optionalClientCondition := anOptionalClientCondition.
	optionalClientSideParameter := anOptionalParameter.
	serverSideParameterBinding := Binding
		undefinedExplainedBy: 'Missing Server Side Parameter'.
	self resetInterpreter