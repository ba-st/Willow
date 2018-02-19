tests-rendering
testOnTrigger

	| html link |

	link := LinkWebView synchronicLabeled: 'Click me!' applying: [  ].
	link onTrigger disable.
	html := self render: link.

	self
		assert: html
		equals:
			'<a id="a-id1">Click me!</a><script type="text/javascript">$("#a-id1").click(function(event){$(this).prop("disabled",true)});</script>'