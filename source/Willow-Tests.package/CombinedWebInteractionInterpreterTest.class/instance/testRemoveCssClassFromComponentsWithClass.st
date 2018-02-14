tests-Configuring - CSS
testRemoveCssClassFromComponentsWithClass

	| interpreter html |

	interpreter := CombinedWebInteractionInterpreter combiningInterpretersOf: self buttons.

	interpreter removeCssClass: WillowCssStyles loading fromComponentsWithClass: WillowCssStyles willow.

	html := self
		renderUsing: [ :canvas | 
			canvas
				render: okButton;
				render: cancelButton ].
	self
		assert: html
		equals:
			'<button id="button-id1" type="button">Ok</button><button id="button-id2" type="button">Cancel</button><script type="text/javascript">$("#button-id1").click(function(event){$(".willow").removeClass("willow-loading")});$("#button-id2").click(function(event){$(".willow").removeClass("willow-loading")});</script>'