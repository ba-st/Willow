test - configuring
testEvaluate

	| interpreter html |

	interpreter := WebInteractionInterpreter forClickOnComponent.
	interpreter evaluate: [  ].
	html := self configureTextInputWith: interpreter.
	self
		assert: html
		equals: '<input id="input-id2" type="text"/><script type="text/javascript">$("#input-id2").click(function(){$.ajax({"dataType":"script","url":"/","data":"1","error":handleAjaxErrorCall})});</script>'