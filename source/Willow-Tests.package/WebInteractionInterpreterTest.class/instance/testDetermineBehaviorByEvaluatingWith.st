tests - Configuring
testDetermineBehaviorByEvaluatingWith

	| interpreter html |

	interpreter := WebInteractionInterpreter forClickOnComponent.
	interpreter
		determineBehaviorByEvaluating: [ :response | response onReturn alert: 'Test is complete' ]
		with: 'theClientParameter'.
	html := self configureTextInputWith: interpreter.
	self
		assert: html
		equals:
			'<input id="input-id3" type="text"/><script type="text/javascript">$("#input-id3").click(function(){Willow.callServer({"type":"POST","url":"/","data":["1","2="+encodeURIComponent(JSON.stringify("theClientParameter"))].join("&")})});</script>'