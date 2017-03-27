tests-Configuring - CSS
testChangeCssClassTo

	| interpreter html |

	interpreter := CombinedWebInteractionInterpreter
		combiningInterpretersOf:
			{okButton.
			cancelButton}.

	interpreter changeCssClass: WillowCssStyles loading to: WillowCssStyles willow.

	html := self
		renderUsing: [ :canvas | 
			canvas
				render: okButton;
				render: cancelButton ].
	self
		assert: html
		equals:
			'<button id="button-id1" type="button">Ok</button><button id="button-id2" type="button">Cancel</button><script type="text/javascript">$("#button-id1").click(function(){$(".willow-loading").removeClass("willow-loading").addClass("willow")});$("#button-id2").click(function(){$(".willow-loading").removeClass("willow-loading").addClass("willow")});</script>'