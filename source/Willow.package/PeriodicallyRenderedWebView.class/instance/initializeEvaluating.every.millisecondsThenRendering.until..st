initialization
initializeEvaluating: aRefreshCommand every: aNumber millisecondsThenRendering: anIdentifiedWebView until: aConditionBlock

	refreshCommand := aRefreshCommand.
	refreshIntervalInMilliseconds := aNumber.
	identifiedViewToRefresh := anIdentifiedWebView.
	conditionBlock := aConditionBlock.
	stopRenderingContent := false