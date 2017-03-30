tests-rendering
testScriptToRefreshAndRenderContentOn

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

	self render: periodicallyRenderedView.
	"This is kind of hacky but there's no other way to test it without a proper AJAX call"
	html := self renderUsing: [ :canvas | canvas div script: (periodicallyRenderedView scriptToRefreshAndRenderContentOn: canvas) ].
	self
		assert: html
		equals:
			'<div id="id2"></div><script type="text/javascript">$("#id2").html("Count:  2<br/><script type=\"text/javascript\">$.ajax({\"url\":\"/\",\"data\":\"1\"});</script>");</script>'