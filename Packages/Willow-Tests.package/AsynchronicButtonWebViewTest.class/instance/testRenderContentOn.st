tests-rendering
testRenderContentOn

	| button html |

	button := AsynchronicButtonWebView labeled: 'Click me!'.
	html := self render: button.
	self assert: html equals: '<button type="button">Click me!</button>'