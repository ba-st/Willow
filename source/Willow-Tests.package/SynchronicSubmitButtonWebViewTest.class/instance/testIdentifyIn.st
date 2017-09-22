tests
testIdentifyIn

	| button html |

	button := SynchronicSubmitButtonWebView labeled: 'Click me!' applying: [ :command |  ] evaluating: [  ].

	html := self
		renderUsing: [ :canvas | 
			button identifyIn: canvas.
			canvas render: button ].

	self
		assert: html equals: '<button id="submit-button-id1" name="2" type="submit">Click me!</button>';
		assert: button identifier equals: 'submit-button-id1'