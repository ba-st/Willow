tests-Configuring-DOM
testSerializeWithHiddenInputs

	| interpreter html |

	interpreter := CombinedWebInteractionInterpreter
		combiningInterpretersOf:
			{okButton.
			cancelButton}.

	interpreter serializeWithHiddenInputs.
	html := self
		renderUsing: [ :canvas | 
			canvas
				render: okButton;
				render: cancelButton ].
	self
		assert: html
		equals:
			'<button id="button-id2" type="button">Ok</button><button id="button-id4" type="button">Cancel</button><script type="text/javascript">$("#button-id2").click(function(){$.ajax({"url":"/","data":["1",$(this).next("input:hidden").addBack().serialize()].join("&"),"dataType":"script","error":Willow.handleAjaxErrorCall})});$("#button-id4").click(function(){$.ajax({"url":"/","data":["3",$(this).next("input:hidden").addBack().serialize()].join("&"),"dataType":"script","error":Willow.handleAjaxErrorCall})});</script>'