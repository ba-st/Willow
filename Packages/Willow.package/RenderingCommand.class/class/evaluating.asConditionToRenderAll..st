instance creation
evaluating: aCallback asConditionToRenderAll: anIdentifiedViewCollection

	self assertInitializationOfAll: anIdentifiedViewCollection.

	^self new initializeEvaluating: aCallback asConditionToRenderAll: anIdentifiedViewCollection