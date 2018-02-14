tests-Configuring - Serialization
testSerializeContainerForm

	| interpreter html |

	interpreter := CombinedWebInteractionInterpreter
		combiningInterpretersOf:
			{okButton.
			cancelButton}.

	interpreter serializeContainerForm.
	html := self
		renderUsing: [ :canvas | 
			canvas
				render: okButton;
				render: cancelButton ].
	self
		assert: html
		equals:
			'<button id="button-id2" type="button">Ok</button><button id="button-id4" type="button">Cancel</button><script type="text/javascript">$("#button-id2").click(function(event){Willow.callServer({"type":"POST","url":"/","data":["1",$(this).closest("form").find(":input").serialize()].join("&")})});$("#button-id4").click(function(event){Willow.callServer({"type":"POST","url":"/","data":["3",$(this).closest("form").find(":input").serialize()].join("&")})});</script>'