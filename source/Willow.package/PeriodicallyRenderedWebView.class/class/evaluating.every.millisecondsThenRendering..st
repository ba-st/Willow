Instance Creation
evaluating: aRefreshCommand every: aNumber millisecondsThenRendering: aViewToRender

	^ self new initializeEvaluating: aRefreshCommand every: aNumber millisecondsThenRendering: (IdentifiedWebView forDivNamed: 'periodically-refreshed' containing: aViewToRender)