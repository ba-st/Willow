test - configuring
testEvaluateWith

	| interpreter html |

	interpreter := WebInteractionInterpreter forClickOnComponent.
	interpreter evaluate: [ :arguments | arguments ] with: #(firstThing secondStuff).
	html := self configureTextInputWith: interpreter.
	self
		assert: html
		equals:
			'<input id="input-id3" type="text"/><script type="text/javascript">$("#input-id3").click(function(){$.ajax({"type":"POST","url":"/","data":["1","2="+encodeURIComponent(JSON.stringify(["firstThing","secondStuff"]))].join("&"),"dataType":"script","error":function(x,t,e){invalidAction(x,t,e)}})});</script>'