tests-rendering
testOnTrigger

	| button html |

	button := AsynchronicButtonWebView labeled: 'Click me!'.
	button onTrigger disable.
	html := self render: button.
	self assert: html equals: '<button id="button-id1" type="button">Click me!</button><script type="text/javascript">$("#button-id1").click(function(){$(this).prop("disabled",true)});</script>'