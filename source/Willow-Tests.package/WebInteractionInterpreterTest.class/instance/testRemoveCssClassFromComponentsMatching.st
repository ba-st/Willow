tests - Configuring - CSS
testRemoveCssClassFromComponentsMatching

	| interpreter html |

	interpreter := WebInteractionInterpreter forClickOnComponent.
	interpreter removeCssClass: WillowCssStyles willow fromComponentsMatching: [ :canvas | canvas jQuery class: 'aComponentByStyleName' ].
	html := self configureTextInputWith: interpreter.
	self
		assert: html
		equals:
			'<input id="input-id1" type="text"/><script type="text/javascript">$("#input-id1").click(function(event){$(".aComponentByStyleName").removeClass("willow")});</script>'