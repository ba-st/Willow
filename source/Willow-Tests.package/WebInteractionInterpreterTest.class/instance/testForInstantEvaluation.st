tests - Instance Creation
testForInstantEvaluation

	| interpreter html |

	interpreter := WebInteractionInterpreter forInstantEvaluation.
	interpreter evaluate: [  ].
	html := self configureTextInputWith: interpreter.
	self
		assert: html
		equals:
			'<input type="text"/><script type="text/javascript">Willow.callServer({"url":"/","data":"1"});</script>'