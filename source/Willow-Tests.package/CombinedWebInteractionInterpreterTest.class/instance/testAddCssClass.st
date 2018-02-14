tests-Configuring - CSS
testAddCssClass

	| interpreter html |

	interpreter := CombinedWebInteractionInterpreter combiningInterpretersOf: self buttons.
	interpreter addCssClass: WillowCssStyles willow.
	html := self
		renderUsing: [ :canvas | 
			canvas
				render: okButton;
				render: cancelButton ].
	self
		assert: html
		equals: '<button id="button-id1" type="button">Ok</button><button id="button-id2" type="button">Cancel</button><script type="text/javascript">$("#button-id1").click(function(event){$(this).addClass("willow")});$("#button-id2").click(function(event){$(this).addClass("willow")});</script>'