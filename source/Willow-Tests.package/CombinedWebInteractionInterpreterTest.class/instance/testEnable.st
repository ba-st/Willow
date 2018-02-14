tests-Configuring-DOM
testEnable

	| interpreter html id |

	interpreter := CombinedWebInteractionInterpreter combiningInterpretersOf: self buttons.
	id := '15'.

	html := self
		renderUsing: [ :canvas | 
			| textInput |

			textInput := canvas textInput.
			textInput id: id.
			interpreter enable: textInput.
			canvas
				render: okButton;
				render: cancelButton ].
	self
		assert: html
		equals:
			'<input id="15" type="text"/><button id="button-id1" type="button">Ok</button><button id="button-id2" type="button">Cancel</button><script type="text/javascript">$("#button-id1").click(function(event){$("#15").prop("disabled",false)});$("#button-id2").click(function(event){$("#15").prop("disabled",false)});</script>'