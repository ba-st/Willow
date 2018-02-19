tests-rendering
testSynchronicLabeledApplying

	| html link |

	link := LinkWebView
		synchronicLabeled: 'Click me!'
		applying: [ :view | view addClass willow ].
	html := self render: link.

	self assert: html equals: '<a class="willow">Click me!</a>'