initialization
initializeEvaluating: aRefreshCommand every: aNumber millisecondsThenRendering: anIdentifiedWebView

	refreshCommand := aRefreshCommand.
	refreshIntervalInMilliseconds := aNumber.
	identifiedViewToRefresh := anIdentifiedWebView.
	stopRenderingContent := false