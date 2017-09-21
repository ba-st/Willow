tests-rendering
testOnTrigger

	| list html |

	list := UnorderedListWebView applying: [  ] listing: #('spoon' 'fork') applyingToEach: [  ].
	list onTrigger disable.

	html := self render: list.

	self assert: html equals: '<ul id="ul-id1"><li>spoon</li><li>fork</li></ul><script type="text/javascript">$("#ul-id1").click(function(){$(this).prop("disabled",true)});</script>'