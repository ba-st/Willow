test - instance creation
testForChangeInHiddenInputDependentComponentValue

	| interpreter html |

	interpreter := WebInteractionInterpreter forChangeInHiddenInputDependentComponentValue.
	interpreter evaluate: [  ].
	html := self configureTextInputWith: interpreter.
	self
		assert: html
		equals:
			'<input id="input-id2" type="text"/><script type="text/javascript">$("#input-id2").change(function(){$.ajax({"url":"/","data":["1",$(this).next("input:hidden").addBack().serialize()].join("&"),"dataType":"script","error":Willow.handleAjaxErrorCall})});</script>'