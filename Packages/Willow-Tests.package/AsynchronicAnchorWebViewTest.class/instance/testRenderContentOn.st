tests-rendering
testRenderContentOn

	| html button |

	button := AsynchronicAnchorWebView labeled: 'Click me!'.
	html := self render: button.

	self assert: html equals: '<a role="button">Click me!</a>'