tests-Supplying
testDelayedViewShowingWhileEvaluatingThenRendering

	| supplier delayedView html |

	supplier := Html5ComponentSupplier new.

	delayedView := supplier delayedViewShowing: 'Loading...' whileEvaluating: [  ] thenRendering: 'Done!'.

	html := self render: delayedView.

	self
		assert: html
		equals: '<div id="Delayed-id1">Loading...</div><script type="text/javascript">Willow.callServer({"url":"/","data":"2"});</script>'