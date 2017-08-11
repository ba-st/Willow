tests - Configuring - DOM
testFocusUsing

	| interpreter html |

	interpreter := WebInteractionInterpreter forChangeInComponentValue.

	interpreter focusUsing: [ :canvas | canvas jQuery this ].
	html := self apply: interpreter toComponentDefinedBy: [ :canvas | canvas textInput ].

	self
		assert: html
		equals:
			'<input id="input-id2" type="text"/><script type="text/javascript">$("#input-id2").change(function(){Willow.callServer({"url":"/","data":"1"})});</script>'