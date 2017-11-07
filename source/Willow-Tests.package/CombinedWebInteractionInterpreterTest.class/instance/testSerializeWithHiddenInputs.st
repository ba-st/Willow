tests-Configuring - Serialization
testSerializeWithHiddenInputs

	| interpreter html |

	interpreter := CombinedWebInteractionInterpreter combiningInterpretersOf: self buttons.

	interpreter serializeWithHiddenInputs.
	html := self
		renderUsing: [ :canvas | 
			canvas
				render: okButton;
				render: cancelButton ].
	self
		assert: html
		equals:
			'<button id="button-id2" type="button">Ok</button><button id="button-id4" type="button">Cancel</button><script type="text/javascript">$("#button-id2").click(function(){Willow.callServer({"type":"POST","url":"/","data":["1",$(this).next("input:hidden").addBack().serialize()].join("&")})});$("#button-id4").click(function(){Willow.callServer({"type":"POST","url":"/","data":["3",$(this).next("input:hidden").addBack().serialize()].join("&")})});</script>'