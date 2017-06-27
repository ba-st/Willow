tests-Configuring - Dialogs
testCloseAllDialogs

	| interpreter html |

	interpreter := WebInteractionInterpreter forClickOnComponent.
	interpreter closeAllDialogs.
	html := self configureTextInputWith: interpreter.
	self
		assert: html
		equals: '<input id="input-id2" type="text"/><script type="text/javascript">$("#input-id2").click(function(){$.ajax({"dataType":"script","url":"/","data":"1","error":Willow.handleAjaxErrorCall})});</script>'