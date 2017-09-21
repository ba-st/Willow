tests-rendering
testOnTrigger

	| button html |

	button := SynchronicSubmitButtonWebView labeled: 'Submit' applying: [  ] evaluating: [  ].
	button onTrigger disable.
	html := self render: button.

	self
		assert: html
		equals:
			'<button name="1" id="button-id2" type="submit">Submit</button><script type="text/javascript">$("#button-id2").click(function(){$(this).prop("disabled",true)});</script>'