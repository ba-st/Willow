tests-Configuring - CSS
testToggleCssClassOn

	| interpreter html |

	interpreter := CombinedWebInteractionInterpreter combiningInterpretersOf: self buttons.

	interpreter toggleCssClass: WillowCssStyles willow on: (IdentifiedWebView forDivNamed: 'example' containing: [  ]).


	html := self
		renderUsing: [ :canvas | 
			canvas
				render: okButton;
				render: cancelButton ].
	self
		assert: html
		equals:
			'<button id="button-id2" type="button">Ok</button><button id="button-id3" type="button">Cancel</button><script type="text/javascript">$("#button-id2").click(function(event){$("#example-id1").toggleClass("willow")});$("#button-id3").click(function(event){$("#example-id1").toggleClass("willow")});</script>'