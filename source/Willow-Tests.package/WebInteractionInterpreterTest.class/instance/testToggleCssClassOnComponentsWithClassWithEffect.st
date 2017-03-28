tests-Configuring - CSS
testToggleCssClassOnComponentsWithClassWithEffect

	| interpreter html |

	interpreter := WebInteractionInterpreter forClickOnComponent.
	interpreter toggleCssClass: WillowCssStyles loading onComponentsWithClass: WillowCssStyles willow withEffect: #bounce.
	html := self apply: interpreter toComponentDefinedBy: [ :canvas | canvas textInput class: WillowCssStyles willow ].
	self
		assert: html
		equals:
			'<input class="willow" id="input-id1" type="text"/><script type="text/javascript">$("#input-id1").click(function(){$(".willow").toggleClass("willow-loading").effect("bounce",{"times":1},"slow")});</script>'