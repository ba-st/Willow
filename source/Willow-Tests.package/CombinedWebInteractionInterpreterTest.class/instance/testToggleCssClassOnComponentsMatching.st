tests-Configuring - CSS
testToggleCssClassOnComponentsMatching

	| interpreter html |

	interpreter := CombinedWebInteractionInterpreter
		combiningInterpretersOf:
			{okButton.
			cancelButton}.

	interpreter toggleCssClass: WillowCssStyles loading onComponentsMatching: [ :canvas | canvas jQuery this ].

	html := self
		renderUsing: [ :canvas | 
			canvas
				render: okButton;
				render: cancelButton ].
	self
		assert: html
		equals:
			'<button id="button-id1" type="button">Ok</button><button id="button-id2" type="button">Cancel</button><script type="text/javascript">$("#button-id1").click(function(){$(this).toggleClass("willow-loading")});$("#button-id2").click(function(){$(this).toggleClass("willow-loading")});</script>'