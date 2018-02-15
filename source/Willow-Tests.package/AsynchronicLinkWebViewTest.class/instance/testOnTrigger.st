tests-rendering
testOnTrigger

	| html link |

	link := AsynchronicLinkWebView labeled: 'Click me!'.
	link onTrigger disable.
	html := self render: link.

	self
		assert: html
		equals:
			'<a id="a-id1">Click me!</a><script type="text/javascript">$("#a-id1").click(function(event){arguments[0].preventDefault();$(this).prop("disabled",true)});</script>'