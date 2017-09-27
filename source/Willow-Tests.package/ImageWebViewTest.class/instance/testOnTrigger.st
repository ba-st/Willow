tests-rendering
testOnTrigger

	| image html |

	image := ImageWebView locatedAt: 'ok.png' applying: [ :theImage |  ].
	image onTrigger disable.
	html := self render: image.

	self assert: html equals: '<img alt="" src="ok.png" id="img-id1"/><script type="text/javascript">$("#img-id1").click(function(){$(this).prop("disabled",true)});</script>'