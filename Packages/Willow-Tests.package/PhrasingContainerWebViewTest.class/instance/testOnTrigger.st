tests-rendering
testOnTrigger

	| container html |

	container := PhrasingContainerWebView obtainingContentFrom: [ 'Hi!' ] applying: (ComponentClassificationCommand toStyleWith: 'teal').
	container onTrigger disable.
	html := self render: container.

	self
		assert: html
		equals:
			'<span id="span-id1" class="teal">Hi!</span><script type="text/javascript">$("#span-id1").click(function(){$(this).prop("disabled",true)});</script>'