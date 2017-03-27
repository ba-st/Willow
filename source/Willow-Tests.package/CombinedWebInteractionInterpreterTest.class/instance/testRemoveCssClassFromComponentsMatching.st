tests-Configuring - CSS
testRemoveCssClassFromComponentsMatching

	| interpreter html |

	interpreter := CombinedWebInteractionInterpreter
		combiningInterpretersOf:
			{okButton.
			cancelButton}.

	interpreter removeCssClass: WillowCssStyles loading fromComponentsMatching: [ :canvas | canvas jQuery this ].

	html := self
		renderUsing: [ :canvas | 
			canvas
				render: okButton;
				render: cancelButton ].
	self
		assert: html
		equals:
			'<button id="button-id1" type="button">Ok</button><button id="button-id2" type="button">Cancel</button><script type="text/javascript">$("#button-id1").click(function(){$(this).removeClass("willow-loading")});$("#button-id2").click(function(){$(this).removeClass("willow-loading")});</script>'