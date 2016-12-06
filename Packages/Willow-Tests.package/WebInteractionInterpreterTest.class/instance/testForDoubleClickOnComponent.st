test - instance creation
testForDoubleClickOnComponent

	| interpreter html |

	interpreter := WebInteractionInterpreter forDoubleClickOnComponent.
	interpreter evaluate: [  ].
	html := self configureTextInputWith: interpreter.
	self
		assert: html
		equals: 
'<input id="input-id2" type="text"/><script type="text/javascript">$("#input-id2").dblclick(function(){$.ajax({"type":"POST","dataType":"script","url":"/","data":"1","error":function(x,t,e){invalidAction(x,t,e)}})});</script>'