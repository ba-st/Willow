tests-Configuring - CSS
testToggleCssClassOnComponentsWithClassWithEffect

	| interpreter html |

	interpreter := CombinedWebInteractionInterpreter
		combiningInterpretersOf:
			{okButton.
			cancelButton}.

	interpreter toggleCssClass: WillowCssStyles loading onComponentsWithClass: WillowCssStyles willow withEffect: #bounce.

	html := self
		renderUsing: [ :canvas | 
			canvas
				render: okButton;
				render: cancelButton ].
	self
		assert: html
		equals:
			'<button id="button-id1" type="button">Ok</button><button id="button-id2" type="button">Cancel</button><script type="text/javascript">$("#button-id1").click(function(){$(".willow").toggleClass("willow-loading").effect("bounce",{"times":1},"slow")});$("#button-id2").click(function(){$(".willow").toggleClass("willow-loading").effect("bounce",{"times":1},"slow")});</script>'