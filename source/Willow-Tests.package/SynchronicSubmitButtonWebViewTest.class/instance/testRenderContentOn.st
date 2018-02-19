tests-rendering
testRenderContentOn

	| synchronicButton html |

	synchronicButton := SynchronicSubmitButtonWebView
		labeled: 'Submit'
		applying: [ :button |  ]
		evaluating: [  ].
	html := self render: synchronicButton.

	self assert: html equals: '<button name="1" type="submit">Submit</button>'