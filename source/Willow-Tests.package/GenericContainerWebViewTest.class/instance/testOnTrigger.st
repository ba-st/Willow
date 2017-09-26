tests
testOnTrigger

	| container html |

	container := GenericContainerWebView obtainingContentFrom: [ 'Hi!' ].
	container onTrigger disable.
	html := self render: container.

	self assert: html equals: '<div id="div-id1">Hi!</div><script type="text/javascript">$("#div-id1").click(function(){$(this).prop("disabled",true)});</script>'