tests-rendering
testOnTrigger

	| synchronicButton html |

	synchronicButton := SynchronicSubmitButtonWebView labeled: 'Submit' applying: [ :button |  ] evaluating: [  ].
	synchronicButton onTrigger disable.
	html := self render: synchronicButton.

	self assert: html equals: '<button name="1" id="button-id2" type="submit">Submit</button><script type="text/javascript">$("#button-id2").click(function(){$(this).prop("disabled",true)});</script>'