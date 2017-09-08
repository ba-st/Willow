Instance Creation
evaluating: aRefreshCommand every: aNumber millisecondsThenRendering: aViewToRender until: aConditionBlock

	^ self new
		initializeEvaluating: aRefreshCommand
		every: aNumber
		millisecondsThenRendering:
			(IdentifiedWebView
				forDivNamed: 'periodically-refreshed'
				containing: aViewToRender)
		until: aConditionBlock