tests - Configuring - CSS
testAddCssClassToComponentsMatching

	| interpreter html |

	interpreter := WebInteractionInterpreter forClickOnComponent.
	interpreter
		addCssClass: WillowCssStyles willow
		toComponentsMatching: [ :canvas | canvas jQuery class: 'aComponentByStyleName' ].
	html := self configureTextInputWith: interpreter.
	self
		assert: html
		equals:
			'<input id="input-id1" type="text"/><script type="text/javascript">$("#input-id1").click(function(){$(".aComponentByStyleName").addClass("willow")});</script>'