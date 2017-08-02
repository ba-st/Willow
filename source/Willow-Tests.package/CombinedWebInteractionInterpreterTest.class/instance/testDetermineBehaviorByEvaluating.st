tests-Configuring
testDetermineBehaviorByEvaluating

	| interpreter html |

	interpreter := CombinedWebInteractionInterpreter
		combiningInterpretersOf:
			{okButton.
			cancelButton}.

	interpreter determineBehaviorByEvaluating: [  ].

	html := self
		renderUsing: [ :canvas | 
			canvas
				render: okButton;
				render: cancelButton ].
	self
		assert: html
		equals:
			'<button id="button-id2" type="button">Ok</button><button id="button-id4" type="button">Cancel</button><script type="text/javascript">$("#button-id2").click(function(){Willow.callServer({"url":"/","data":"1"})});$("#button-id4").click(function(){Willow.callServer({"url":"/","data":"3"})});</script>'