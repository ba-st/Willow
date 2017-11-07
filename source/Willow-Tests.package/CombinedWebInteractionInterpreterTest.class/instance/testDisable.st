tests-Configuring-DOM
testDisable

	| interpreter html |

	interpreter := CombinedWebInteractionInterpreter combiningInterpretersOf: self buttons.

	html := self
		renderUsing: [ :canvas | 
			interpreter disable.
			canvas
				render: okButton;
				render: cancelButton ].
	self
		assert: html
		equals:
			'<button id="button-id1" type="button">Ok</button><button id="button-id2" type="button">Cancel</button><script type="text/javascript">$("#button-id1").click(function(){$(this).prop("disabled",true)});$("#button-id2").click(function(){$(this).prop("disabled",true)});</script>'