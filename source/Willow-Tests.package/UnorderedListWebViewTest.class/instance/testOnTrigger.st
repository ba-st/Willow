tests-rendering
testOnTrigger

	| unorderedList html |

	unorderedList := UnorderedListWebView applying: [ :list |  ] listing: #('spoon' 'fork') applyingToEach: [ :listItem |  ].
	unorderedList onTrigger disable.

	html := self render: unorderedList.

	self assert: html equals: '<ul id="ul-id1"><li>spoon</li><li>fork</li></ul><script type="text/javascript">$("#ul-id1").click(function(event){$(this).prop("disabled",true)});</script>'