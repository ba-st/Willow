tests-rendering
testOnTrigger

	| button html |

	button := AsynchronicButtonWebView labeled: 'Click me!'.
	button id: 'button-123'.
	button onTrigger disable.
	html := self render: button.
	self assert: html equals: '<button id="button-123" type="button">Click me!</button><script type="text/javascript">$("#button-123").click(function(){$(this).prop("disabled",true)});</script>'