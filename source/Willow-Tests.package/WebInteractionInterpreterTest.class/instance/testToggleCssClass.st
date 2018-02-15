tests - Configuring - CSS
testToggleCssClass

	| interpreter html |

	interpreter := WebInteractionInterpreter forClickOnComponent.
	interpreter toggleCssClass: WillowCssStyles loading.
	html := self apply: interpreter toComponentDefinedBy: [ :canvas | canvas textInput class: WillowCssStyles loading ].
	self
		assert: html
		equals:
			'<input class="willow-loading" id="input-id1" type="text"/><script type="text/javascript">$("#input-id1").click(function(event){$(this).toggleClass("willow-loading")});</script>'