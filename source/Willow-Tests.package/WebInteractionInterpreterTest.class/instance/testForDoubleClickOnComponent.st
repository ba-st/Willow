test - instance creation
testForDoubleClickOnComponent

	| interpreter html |

	interpreter := WebInteractionInterpreter forDoubleClickOnComponent.
	interpreter evaluate: [  ].
	html := self configureTextInputWith: interpreter.
	self
		assert: html
		equals:
			'<input id="input-id2" type="text"/><script type="text/javascript">$("#input-id2").dblclick(function(){$.ajax({"dataType":"script","url":"/","data":"1","error":Willow.handleAjaxErrorCall})});</script>'