tests-rendering
testOnTrigger

	| synchronicButton html |

	synchronicButton := SynchronicSubmitButtonWebView
		labeled: 'Submit'
		applying: [ :button |  ].
	synchronicButton onTrigger disable.
	html := self render: synchronicButton.

	self
		assert: html
		equals:
			'<button id="button-id1" type="submit">Submit</button><script type="text/javascript">$("#button-id1").click(function(event){$(this).prop("disabled",true)});</script>'