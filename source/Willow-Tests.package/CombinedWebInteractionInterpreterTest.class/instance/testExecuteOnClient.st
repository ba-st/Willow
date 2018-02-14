tests-Configuring
testExecuteOnClient

	| interpreter html |

	interpreter := CombinedWebInteractionInterpreter combiningInterpretersOf: self buttons.

	interpreter executeOnClient: [ :script :canvas | script << (JSStream on: 'window') call: 'print' ].

	html := self
		renderUsing: [ :canvas | 
			canvas
				render: okButton;
				render: cancelButton ].
	self
		assert: html
		equals:
			'<button id="button-id1" type="button">Ok</button><button id="button-id2" type="button">Cancel</button><script type="text/javascript">$("#button-id1").click(function(event){window.print()});$("#button-id2").click(function(event){window.print()});</script>'