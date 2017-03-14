initialize-release
initializeEvaluating: aCallback asConditionToRenderAll: anIdentifiedViewCollection

	shouldRender := true.
	renderingCondition := aCallback.
	identifiedViews  := anIdentifiedViewCollection