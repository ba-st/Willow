tests - Configuring
testDetermineBehaviorByEvaluating

	| interpreter html |

	interpreter := WebInteractionInterpreter forClickOnComponent.
	interpreter
		determineBehaviorByEvaluating: [ :response | response onReturn alert: 'Test is complete' ].
	html := self configureTextInputWith: interpreter.
	self
		assert: html
		equals:
			'<input id="input-id2" type="text"/><script type="text/javascript">$("#input-id2").click(function(){Willow.callServer({"url":"/","data":"1"})});</script>'