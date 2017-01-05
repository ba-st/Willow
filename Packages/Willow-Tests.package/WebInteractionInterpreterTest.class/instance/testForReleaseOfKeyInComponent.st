test - instance creation
testForReleaseOfKeyInComponent

	| interpreter html |

	interpreter := WebInteractionInterpreter forReleaseOfKeyInComponent.
	interpreter evaluate: [  ].
	html := self configureTextInputWith: interpreter.
	self
		assert: html
		equals: 
'<input id="input-id2" type="text"/><script type="text/javascript">$("#input-id2").keyup(function(){$.ajax({"type":"POST","url":"/","data":["1",$(this).serialize()].join("&"),"dataType":"script","error":function(x,t,e){invalidAction(x,t,e)}})});</script>'