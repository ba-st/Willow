instance creation
forEvaluationOf: aSelector withAll: aParameterArray

	^self workingWith:
		(WebComponentInteraction triggeredOnEvaluationOf: aSelector withAll: aParameterArray)