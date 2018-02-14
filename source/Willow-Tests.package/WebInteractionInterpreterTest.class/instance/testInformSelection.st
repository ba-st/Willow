tests - Configuring
testInformSelection

	| interpreter html |

	interpreter := WebInteractionInterpreter forClickOnComponent.
	interpreter informSelection.
	html := self configureTextInputWith: interpreter.
	self
		assert: html
		equals:
			'<input id="input-id1" type="text"/><script type="text/javascript">$("#input-id1").click(function(event){alert($(this).children("option:selected").text())});</script>'