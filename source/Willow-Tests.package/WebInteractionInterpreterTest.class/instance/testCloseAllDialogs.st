tests - Configuring - Dialogs
testCloseAllDialogs

	| interpreter html |

	interpreter := WebInteractionInterpreter forClickOnComponent.
	interpreter closeAllDialogs.
	html := self configureTextInputWith: interpreter.
	self
		assert: html
		equals:
			'<input id="input-id2" type="text"/><script type="text/javascript">$("#input-id2").click(function(event){Willow.callServer({"url":"/","data":"1"})});</script>'