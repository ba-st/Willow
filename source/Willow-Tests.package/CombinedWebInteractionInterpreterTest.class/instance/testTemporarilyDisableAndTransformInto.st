tests-Configuring-DOM
testTemporarilyDisableAndTransformInto

	| interpreter html id |

	interpreter := CombinedWebInteractionInterpreter combiningInterpretersOf: self buttons.
	id := '15'.

	html := self
		renderUsing: [ :canvas | 
			| textInput |

			textInput := canvas textInput.
			textInput id: id.
			interpreter temporarilyDisableAndTransform: textInput into: 'Loading...'.
			canvas
				render: okButton;
				render: cancelButton ].
	self
		assert: html
		equals:
			'<input id="15" type="text"/><button id="button-id2" type="button">Ok</button><button id="button-id4" type="button">Cancel</button><script type="text/javascript">$("#button-id2").click(function(){Willow.callServer({"data":[disabledComponent=$("#15").html(),$("#15").addClass("willow-disabled-component").attr("disabled",true).html("Loading..."),"1"].join("&"),"complete":function(){$(".willow-disabled-component").attr("disabled",false).removeClass("willow-disabled-component").html(disabledComponent)},"url":"/"})});$("#button-id4").click(function(){Willow.callServer({"data":[disabledComponent=$("#15").html(),$("#15").addClass("willow-disabled-component").attr("disabled",true).html("Loading..."),"3"].join("&"),"complete":function(){$(".willow-disabled-component").attr("disabled",false).removeClass("willow-disabled-component").html(disabledComponent)},"url":"/"})});</script>'