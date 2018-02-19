tests-rendering
testRenderContentOn

	| html link |

	link := LinkWebView labeled: 'Click me!'.
	html := self render: link.

	self assert: html equals: '<a>Click me!</a>'