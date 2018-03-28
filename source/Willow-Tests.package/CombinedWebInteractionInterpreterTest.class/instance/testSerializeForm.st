tests-Configuring - Serialization
testSerializeForm

	| interpreter html |

	interpreter := CombinedWebInteractionInterpreter combiningInterpretersOf: self buttons.


	html := self
		renderUsing: [ :canvas | 
			| form |

			form := canvas form.
			form id: 'id15'.

			interpreter serializeForm: form.
			canvas
				render: okButton;
				render: cancelButton ].
	self
		assert: html
		equals:
			'<form accept-charset="utf-8" method="post" action="/" id="id15"></form><button id="button-id2" type="button">Ok</button><button id="button-id4" type="button">Cancel</button><script type="text/javascript">$("#button-id2").click(function(event){Willow.callServer({"type":"POST","url":"/","data":["1",$("#id15").serialize()].join("&")})});$("#button-id4").click(function(event){Willow.callServer({"type":"POST","url":"/","data":["3",$("#id15").serialize()].join("&")})});</script>'