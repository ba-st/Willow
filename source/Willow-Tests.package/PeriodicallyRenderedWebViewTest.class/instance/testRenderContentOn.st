tests-rendering
testRenderContentOn

	| periodicallyRenderedView html counter |

	counter := 0.
	periodicallyRenderedView := PeriodicallyRenderedWebView
		evaluating: [ counter := counter + 1 ]
		every: 500
		millisecondsThenRendering: [ :canvas | 
			canvas
				render: 'Count:  ';
				render: counter;
				break ].

	html := self render: periodicallyRenderedView.

	self
		assert: html
		equals:
			'<div id="periodically-refreshed-id1">Count:  1<br/></div><script type="text/javascript">setTimeout(function(){$.ajax({"dataType":"script","url":"/","data":"2"})},500)</script>'.

	"I have to simulate the AJAX call"
	html := self renderUsing: [ :canvas | periodicallyRenderedView refreshAndRenderContentOn: canvas ].
	self assert: html equals: 'Count:  2<br/><script type="text/javascript">$.ajax({"url":"/","data":"1"});</script>'.
	html := self renderUsing: [ :canvas | periodicallyRenderedView refreshAndRenderContentOn: canvas ].
	self assert: html equals: 'Count:  3<br/><script type="text/javascript">$.ajax({"url":"/","data":"1"});</script>'