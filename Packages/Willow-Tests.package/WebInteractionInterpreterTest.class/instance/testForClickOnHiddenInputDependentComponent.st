test - instance creation
testForClickOnHiddenInputDependentComponent

	| interpreter html |

	interpreter := WebInteractionInterpreter forClickOnHiddenInputDependentComponent.
	interpreter evaluate: [  ].
	html := self configureTextInputWith: interpreter.
	'<input id="input-id2" type="text"/><script type="text/javascript">$("#input-id2").click(function(){$.ajax({"type":"POST","url":"/","data":["1",$(this).next("input:hidden").addBack().serialize()].join("&"),"dataType":"script","error":function(x,t,e){invalidAction(x,t,e)}})});</script>'