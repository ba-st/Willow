tests-Configuring
testInform

	| interpreter html |

	interpreter := CombinedWebInteractionInterpreter
		combiningInterpretersOf:
			{okButton.
			cancelButton}.

	interpreter inform: 'A message'.
	html := self
		renderUsing: [ :canvas | 
			canvas
				render: okButton;
				render: cancelButton ].
	self
		assert: html
		equals:
			'<button id="button-id1" type="button">Ok</button><button id="button-id2" type="button">Cancel</button><script type="text/javascript">$("#button-id1").click(function(){alert("A message")});$("#button-id2").click(function(){alert("A message")});</script>'