tests-Configuring
testDetermineBehaviorByEvaluatingWith

	| interpreter html |

	interpreter := CombinedWebInteractionInterpreter combiningInterpretersOf: self buttons.

	interpreter determineBehaviorByEvaluating: [  ] with: 'theClientParameter'.

	html := self
		renderUsing: [ :canvas | 
			canvas
				render: okButton;
				render: cancelButton ].
	self
		assert: html
		equals:
			'<button id="button-id3" type="button">Ok</button><button id="button-id6" type="button">Cancel</button><script type="text/javascript">$("#button-id3").click(function(event){Willow.callServer({"type":"POST","url":"/","data":["1","2="+encodeURIComponent(JSON.stringify("theClientParameter"))].join("&")})});$("#button-id6").click(function(event){Willow.callServer({"type":"POST","url":"/","data":["4","5="+encodeURIComponent(JSON.stringify("theClientParameter"))].join("&")})});</script>'