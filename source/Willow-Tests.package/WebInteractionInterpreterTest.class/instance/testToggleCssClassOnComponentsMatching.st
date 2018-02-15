tests - Configuring - CSS
testToggleCssClassOnComponentsMatching

	| interpreter html |

	interpreter := WebInteractionInterpreter forClickOnComponent.
	interpreter toggleCssClass: WillowCssStyles willow onComponentsMatching: [ :canvas | canvas jQuery class: 'aComponentByStyleName' ].
	html := self configureTextInputWith: interpreter.
	self
		assert: html
		equals:
			'<input id="input-id1" type="text"/><script type="text/javascript">$("#input-id1").click(function(event){$(".aComponentByStyleName").toggleClass("willow")});</script>'