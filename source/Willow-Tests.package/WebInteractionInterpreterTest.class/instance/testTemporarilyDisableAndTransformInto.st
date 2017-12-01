tests - Configuring - DOM
testTemporarilyDisableAndTransformInto

	| interpreter html id |

	interpreter := WebInteractionInterpreter forChangeInComponentValue.
	id := '15'.
	html := self
		renderUsing: [ :canvas | 
			| textInput |

			textInput := canvas textInput.
			textInput id: id.
			interpreter temporarilyDisableAndTransform: textInput into: 'Loading...'.
			interpreter applyTo: textInput on: canvas ].

	self
		assert: html
		equals:
			'<input id="15" type="text"/><script type="text/javascript">$("#15").change(function(){disabledComponent=$("#15").html();$("#15").addClass("willow-disabled-component").attr("disabled",true).html("Loading...");Willow.callServer({"complete":function(){$(".willow-disabled-component").attr("disabled",false).removeClass("willow-disabled-component").html(disabledComponent)},"url":"/","data":"1"})});</script>'