tests-rendering
testRenderContentOn

	| html link |

	link := LinkWebView synchronicLabeled: 'Click me!' applying: [  ].
	html := self render: link.

	self assert: html equals: '<a>Click me!</a>'