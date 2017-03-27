tests-Configuring-DOM
testSerializeIt

	| interpreter html |

	interpreter := CombinedWebInteractionInterpreter
		combiningInterpretersOf:
			{okButton.
			cancelButton}.

	interpreter serializeIt.
	html := self
		renderUsing: [ :canvas | 
			canvas
				render: okButton;
				render: cancelButton ].
	self
		assert: html
		equals:
			'<button id="button-id2" type="button">Ok</button><button id="button-id4" type="button">Cancel</button><script type="text/javascript">$("#button-id2").click(function(){$.ajax({"url":"/","data":["1",$(this).serialize()].join("&"),"dataType":"script","error":handleAjaxErrorCall})});$("#button-id4").click(function(){$.ajax({"url":"/","data":["3",$(this).serialize()].join("&"),"dataType":"script","error":handleAjaxErrorCall})});</script>'