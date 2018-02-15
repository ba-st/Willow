tests - Instance Creation
testForDoubleClickOnComponent

	| interpreter html |

	interpreter := WebInteractionInterpreter forDoubleClickOnComponent.
	interpreter evaluate: [  ].
	html := self configureTextInputWith: interpreter.
	self
		assert: html
		equals:
			'<input id="input-id2" type="text"/><script type="text/javascript">$("#input-id2").dblclick(function(event){Willow.callServer({"url":"/","data":"1"})});</script>'