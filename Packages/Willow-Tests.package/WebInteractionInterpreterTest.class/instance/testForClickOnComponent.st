test - instance creation
testForClickOnComponent

	| interpreter html |

	interpreter := WebInteractionInterpreter forClickOnComponent.
	interpreter evaluate: [  ].
	html := self configureTextInputWith: interpreter.
	self
		assert: html
		equals:
			'<input id="input-id2" type="text"/><script type="text/javascript">$("#input-id2").click(function(){$.ajax({"type":"POST","dataType":"script","url":"/","data":"1","error":function(x,t,e){invalidAction(x,t,e)}})});</script>'