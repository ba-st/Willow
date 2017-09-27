tests-rendering
testDisabled

	| synchronicButton html |

	synchronicButton := SynchronicSubmitButtonWebView labeled: 'Submit' applying: [ :button |  ] evaluating: [  ].
	synchronicButton disabled.
	html := self render: synchronicButton.

	self assert: html equals: '<button name="1" disabled="disabled" type="submit">Submit</button>'