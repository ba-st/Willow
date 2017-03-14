instance creation
triggeredOnEvaluationOf: aSelector withAll: aParameterArray

	^ self
		triggeredAccordingTo: (FunctionEvaluationTrigger sending: aSelector parameterizedBy: aParameterArray)
		serializingWith: SerializationCommand forCurrentObject