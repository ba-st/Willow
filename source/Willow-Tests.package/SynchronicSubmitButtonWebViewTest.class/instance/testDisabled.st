tests-rendering
testDisabled

	| button html |

	button := SynchronicSubmitButtonWebView labeled: 'Submit' applying: CompositeComponentCommand empty evaluating: [  ].
	button disabled.
	html := self render: button.

	self assert: html equals: '<button name="1" disabled="disabled" type="submit">Submit</button>'