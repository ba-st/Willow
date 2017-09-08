tests-rendering
testRenderingStopsWhenStopConditionIsReached

	| periodicallyRenderedView html counter blockWasEvaluated scripts |

	counter := 0.
	blockWasEvaluated := false.
	periodicallyRenderedView := PeriodicallyRenderedWebView
		evaluating: [ counter := counter + 1 ]
		every: 500
		millisecondsThenRendering: [ :canvas | 
			canvas
				render: 'Count: ';
				render: counter;
				break ]
		until: [ blockWasEvaluated := true.
			false ].
	scripts := OrderedCollection new.
	html := self render: periodicallyRenderedView.
	self
		assert: html
		equals: '<div id="periodically-refreshed-id1">Count: 1<br/></div><script type="text/javascript">setTimeout(function(){$.ajax({"dataType":"script","url":"/","data":"2"})},500)</script>'.
	self deny: blockWasEvaluated.
	"I have to simulate the AJAX call"
	html := self
		renderUsing: [ :canvas | 
			periodicallyRenderedView refreshAndRenderContentOn: canvas.
			scripts addAll: canvas document loadScripts ].
	self assert: html equals: 'Count: 2<br/><script type="text/javascript">$.ajax({"url":"/","data":"1"});</script>'.
	scripts any processCallback.
	self assert: blockWasEvaluated.
	html := self renderUsing: [ :canvas | periodicallyRenderedView refreshAndRenderContentOn: canvas ].
	self assert: html equals: 'Count: 3<br/><script type="text/javascript">$.ajax({"url":"/","data":"1"});</script>'