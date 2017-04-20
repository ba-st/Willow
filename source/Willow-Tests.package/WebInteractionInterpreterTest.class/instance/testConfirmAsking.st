tests-Configuring-DOM
testConfirmAsking

	| interpreter html |

	interpreter := WebInteractionInterpreter forClickOnComponent.
	interpreter confirmAsking: 'Continue?'.
	html := self configureTextInputWith: interpreter.
	self
		assert: html
		equals:
			'<input id="input-id2" type="text"/><script type="text/javascript">$("#input-id2").click(function(){if(confirm("Continue?")){$.ajax({"dataType":"script","url":"/","data":"1","error":Willow.handleAjaxErrorCall})}});</script>'