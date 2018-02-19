tests-rendering
testAsynchronicLabeledApplying

	| html link |

	link := LinkWebView
		asynchronicLabeled: 'Click me!'
		applying: [ :view | view addClass willow ].
	html := self render: link.

	self
		assert: html
		equals:
			'<a id="a-id1" class="willow">Click me!</a><script type="text/javascript">$("#a-id1").click(function(event){arguments[0].preventDefault()});</script>'