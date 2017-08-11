tests - Instance Creation
testForChangeInHiddenInputDependentComponentValue

	| interpreter html |

	interpreter := WebInteractionInterpreter forChangeInHiddenInputDependentComponentValue.
	interpreter evaluate: [  ].
	html := self configureTextInputWith: interpreter.
	self
		assert: html
		equals:
			'<input id="input-id2" type="text"/><script type="text/javascript">$("#input-id2").change(function(){Willow.callServer({"type":"POST","url":"/","data":["1",$(this).next("input:hidden").addBack().serialize()].join("&")})});</script>'