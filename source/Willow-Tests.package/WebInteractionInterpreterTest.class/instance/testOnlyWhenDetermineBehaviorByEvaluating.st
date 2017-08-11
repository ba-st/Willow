tests - Configuring
testOnlyWhenDetermineBehaviorByEvaluating

	| interpreter html |

	interpreter := WebInteractionInterpreter forClickOnComponent.
	interpreter
		onlyWhen: '<1s> != null'
		determineBehaviorByEvaluating: [ :response | response onReturn alert: 'Test is complete' ]
		with: (JSStream on: 'theClientParameter').
	html := self configureTextInputWith: interpreter.
	self
		assert: html
		equals:
			'<input id="input-id3" type="text"/><script type="text/javascript">$("#input-id3").click(function(){if(theClientParameter != null){Willow.callServer({"type":"POST","url":"/","data":["1","2="+encodeURIComponent(JSON.stringify(theClientParameter))].join("&")})}});</script>'