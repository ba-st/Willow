tests-Configuring-DOM
testSetValueToWithoutTriggeringChangeOnComponentWithId

	| interpreter html id |

	interpreter := CombinedWebInteractionInterpreter
		combiningInterpretersOf:
			{okButton.
			cancelButton}.
	id := '15'.

	interpreter setValueTo: [ 'Ok' ] withoutTriggeringChangeOnComponentWithId: id.

	html := self
		renderUsing: [ :canvas | 
			canvas textInput id: id.
			canvas
				render: okButton;
				render: cancelButton ].
	self
		assert: html
		equals:
			'<input id="15" type="text"/><button id="button-id2" type="button">Ok</button><button id="button-id4" type="button">Cancel</button><script type="text/javascript">$("#button-id2").click(function(){$.ajax({"dataType":"script","url":"/","data":"1","error":handleAjaxErrorCall})});$("#button-id4").click(function(){$.ajax({"dataType":"script","url":"/","data":"3","error":handleAjaxErrorCall})});</script>'