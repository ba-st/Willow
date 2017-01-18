tests-rendering
testOnTrigger

	| html button |

	button := AsynchronicAnchorWebView labeled: 'Click me!'.
	button onTrigger disable.
	html := self render: button.

	self
		assert: html
		equals:
			'<a role="button" id="a-id1">Click me!</a><script type="text/javascript">$("#a-id1").click(function(){$(this).prop("disabled",true)});</script>'