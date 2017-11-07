tests-Configuring - Serialization
testSubmitForm

	| interpreter html id |

	interpreter := CombinedWebInteractionInterpreter combiningInterpretersOf: self buttons.
	id := '15'.

	html := self
		renderUsing: [ :canvas | 
			| form anchor |

			form := canvas form.
			form id: id.
			interpreter submitForm: form.
			canvas
				render: okButton;
				render: cancelButton ].

	self
		assert: html
		equals:
			'<form accept-charset="UTF-8" method="post" action="/" id="15"></form><button id="button-id2" type="button">Ok</button><button id="button-id4" type="button">Cancel</button><script type="text/javascript">$("#button-id2").click(function(){Willow.callServer({"url":"/","data":"1"})});$("#button-id4").click(function(){Willow.callServer({"url":"/","data":"3"})});</script>'