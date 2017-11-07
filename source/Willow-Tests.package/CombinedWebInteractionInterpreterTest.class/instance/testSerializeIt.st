tests-Configuring - Serialization
testSerializeIt

	| interpreter html |

	interpreter := CombinedWebInteractionInterpreter combiningInterpretersOf: self buttons.

	interpreter serializeIt.
	html := self
		renderUsing: [ :canvas | 
			canvas
				render: okButton;
				render: cancelButton ].
	self
		assert: html
		equals:
			'<button id="button-id2" type="button">Ok</button><button id="button-id4" type="button">Cancel</button><script type="text/javascript">$("#button-id2").click(function(){Willow.callServer({"type":"POST","url":"/","data":["1",$(this).serialize()].join("&")})});$("#button-id4").click(function(){Willow.callServer({"type":"POST","url":"/","data":["3",$(this).serialize()].join("&")})});</script>'