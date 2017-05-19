tests-Configuring - Serialization
testSubmitForm

	| interpreter html id |

	interpreter := CombinedWebInteractionInterpreter
		combiningInterpretersOf:
			{okButton.
			cancelButton}.
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
			'<form accept-charset="UTF-8" method="post" action="/" id="15"></form><button id="button-id2" type="button">Ok</button><button id="button-id4" type="button">Cancel</button><script type="text/javascript">$("#button-id2").click(function(){$.ajax({"dataType":"script","url":"/","data":"1","error":Willow.handleAjaxErrorCall})});$("#button-id4").click(function(){$.ajax({"dataType":"script","url":"/","data":"3","error":Willow.handleAjaxErrorCall})});</script>'