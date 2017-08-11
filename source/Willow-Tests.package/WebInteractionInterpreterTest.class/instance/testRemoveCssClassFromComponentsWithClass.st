tests - Configuring - CSS
testRemoveCssClassFromComponentsWithClass

	| interpreter html |

	interpreter := WebInteractionInterpreter forClickOnComponent.
	interpreter removeCssClass: WillowCssStyles loading fromComponentsWithClass: WillowCssStyles willow.
	html := self
		apply: interpreter
		toComponentDefinedBy: [ :canvas | 
			canvas textInput
				class: WillowCssStyles loading;
				class: WillowCssStyles willow ].
	self
		assert: html
		equals:
			'<input class="willow-loading willow" id="input-id1" type="text"/><script type="text/javascript">$("#input-id1").click(function(){$(".willow").removeClass("willow-loading")});</script>'