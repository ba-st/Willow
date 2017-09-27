tests-Supplying
testDelayedViewShowingWhileEvaluatingThenRendering

	self
		assertRenderingOf: [ :supplier | supplier delayedViewShowing: 'Loading...' whileEvaluating: [  ] thenRendering: 'Done!' ]
		equals: '<div id="Delayed-id1">Loading...</div><script type="text/javascript">Willow.callServer({"url":"/","data":"2"});</script>'