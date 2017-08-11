tests - Configuring - CSS
testAddCssClass

	| interpreter html |

	interpreter := WebInteractionInterpreter forClickOnComponent.
	interpreter addCssClass: WillowCssStyles willow.
	html := self configureTextInputWith: interpreter.
	self
		assert: html
		equals: '<input id="input-id1" type="text"/><script type="text/javascript">$("#input-id1").click(function(){$(this).addClass("willow")});</script>'