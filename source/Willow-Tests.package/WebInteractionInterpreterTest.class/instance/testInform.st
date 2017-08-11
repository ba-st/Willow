tests - Configuring
testInform

	| interpreter html |

	interpreter := WebInteractionInterpreter forClickOnComponent.
	interpreter inform: 'A message'.
	html := self configureTextInputWith: interpreter.
	self
		assert: html
		equals:
			'<input id="input-id1" type="text"/><script type="text/javascript">$("#input-id1").click(function(){alert("A message")});</script>'