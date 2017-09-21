tests-rendering
testOnTrigger

	| container html |

	container := PhrasingContainerWebView obtainingContentFrom: [ 'Hi!' ] applying: [ :command | command css willow ].
	container onTrigger disable.
	html := self render: container.

	self assert: html equals: '<span id="span-id1" class="willow">Hi!</span><script type="text/javascript">$("#span-id1").click(function(){$(this).prop("disabled",true)});</script>'