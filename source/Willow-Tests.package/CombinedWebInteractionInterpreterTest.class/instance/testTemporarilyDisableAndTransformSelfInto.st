tests-Configuring-DOM
testTemporarilyDisableAndTransformSelfInto

	| interpreter html |

	interpreter := CombinedWebInteractionInterpreter combiningInterpretersOf: self buttons.

	html := self
		renderUsing: [ :canvas | 
			interpreter temporarilyDisableAndTransformInto: 'Loading...'.
			canvas
				render: okButton;
				render: cancelButton ].
	self
		assert: html
		equals:
			'<button id="button-id2" type="button">Ok</button><button id="button-id4" type="button">Cancel</button><script type="text/javascript">$("#button-id2").click(function(event){disabledComponent=$(this).html();$(this).addClass("willow-disabled-component").attr("disabled",true).html("Loading...");Willow.callServer({"complete":function(){$(".willow-disabled-component").attr("disabled",false).removeClass("willow-disabled-component").html(disabledComponent)},"url":"/","data":"1"})});$("#button-id4").click(function(event){disabledComponent=$(this).html();$(this).addClass("willow-disabled-component").attr("disabled",true).html("Loading...");Willow.callServer({"complete":function(){$(".willow-disabled-component").attr("disabled",false).removeClass("willow-disabled-component").html(disabledComponent)},"url":"/","data":"3"})});</script>'