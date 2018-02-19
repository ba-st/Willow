tests-rendering
testRenderContentOn

	| synchronicButton html |

	synchronicButton := SynchronicSubmitButtonWebView
		labeled: 'Submit'
		applying: [ :button |  ].
	html := self render: synchronicButton.

	self
		assert: html
		equals: '<button type="submit">Submit</button>'