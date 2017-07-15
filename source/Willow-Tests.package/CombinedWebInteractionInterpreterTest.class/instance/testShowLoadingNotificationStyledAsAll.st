tests-Configuring-DOM
testShowLoadingNotificationStyledAsAll

	| interpreter html |

	interpreter := CombinedWebInteractionInterpreter
		combiningInterpretersOf:
			{okButton.
			cancelButton}.

	interpreter showLoadingNotificationStyledAsAll: #().
	html := self
		renderUsing: [ :canvas | 
			canvas
				render: okButton;
				render: cancelButton ].
	self
		assert: html
		equals:
			'<button id="button-id2" type="button">Ok</button><button id="button-id4" type="button">Cancel</button><script type="text/javascript">$("#button-id2").click(function(){$("#willow-notification-section").html("<div>Loading...</div>");Willow.callServer({"url":"/","data":"1"})});$("#button-id4").click(function(){$("#willow-notification-section").html("<div>Loading...</div>");Willow.callServer({"url":"/","data":"3"})});</script>'