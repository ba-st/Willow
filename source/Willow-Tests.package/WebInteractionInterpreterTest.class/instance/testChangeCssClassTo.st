tests-Configuring - CSS
testChangeCssClassTo

	| interpreter html |

	interpreter := WebInteractionInterpreter forClickOnComponent.
	interpreter changeCssClass: WillowCssStyles loading to: WillowCssStyles willow.
	html := self apply: interpreter toComponentDefinedBy: [ :canvas | canvas textInput class: WillowCssStyles loading ].
	self
		assert: html
		equals:
			'<input class="willow-loading" id="input-id1" type="text"/><script type="text/javascript">$("#input-id1").click(function(){$(".willow-loading").removeClass("willow-loading").addClass("willow")});</script>'