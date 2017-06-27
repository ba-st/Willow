tests-Configuring - Dialogs
testOpen

	| interpreter html |

	interpreter := CombinedWebInteractionInterpreter
		combiningInterpretersOf:
			{okButton.
			cancelButton}.

	interpreter open: [ :canvas | canvas dialog attributeAt: 'open' put: true ].

	html := self
		renderUsing: [ :canvas | 
			canvas
				render: okButton;
				render: cancelButton ].

	self
		assert: html
		equals:
			'<button id="button-id2" type="button">Ok</button><button id="button-id4" type="button">Cancel</button><script type="text/javascript">$("#button-id2").click(function(){$.ajax({"dataType":"script","url":"/","data":"1","error":Willow.handleAjaxErrorCall})});$("#button-id4").click(function(){$.ajax({"dataType":"script","url":"/","data":"3","error":Willow.handleAjaxErrorCall})});</script>'