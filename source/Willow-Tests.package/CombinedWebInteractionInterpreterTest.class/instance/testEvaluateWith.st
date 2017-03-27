tests-Configuring
testEvaluateWith

	| interpreter html |

	interpreter := CombinedWebInteractionInterpreter
		combiningInterpretersOf:
			{okButton.
			cancelButton}.

	interpreter evaluate: [ :arguments | arguments ] with: #(firstThing secondStuff).

	html := self
		renderUsing: [ :canvas | 
			canvas
				render: okButton;
				render: cancelButton ].
	self
		assert: html
		equals: '<button id="button-id3" type="button">Ok</button><button id="button-id6" type="button">Cancel</button><script type="text/javascript">$("#button-id3").click(function(){$.ajax({"type":"POST","url":"/","data":["1","2="+encodeURIComponent(JSON.stringify(["firstThing","secondStuff"]))].join("&"),"dataType":"script","error":handleAjaxErrorCall})});$("#button-id6").click(function(){$.ajax({"type":"POST","url":"/","data":["4","5="+encodeURIComponent(JSON.stringify(["firstThing","secondStuff"]))].join("&"),"dataType":"script","error":handleAjaxErrorCall})});</script>'