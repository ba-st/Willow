tests-rendering
testIdentifyIn

	| button html |

	button := AsynchronicButtonWebView labeled: 'Click me!'.

	html := self
		renderUsing: [ :canvas | 
			button identifyIn: canvas.
			canvas render: button ].

	self
		assert: html equals: '<button id="button-id1" type="button">Click me!</button>';
		assert: button identifier equals: 'button-id1'