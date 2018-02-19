tests
testIdentifyIn

	| synchronicButton html |

	synchronicButton := SynchronicSubmitButtonWebView
		labeled: 'Click me!'
		applying: [ :button |  ].

	html := self
		renderUsing: [ :canvas | 
			synchronicButton identifyIn: canvas.
			canvas render: synchronicButton ].

	self
		assert: html equals: '<button id="submit-button-id1" type="submit">Click me!</button>';
		assert: synchronicButton identifier equals: 'submit-button-id1'