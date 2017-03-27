tests-Configuring-DOM
testTemporarilyDisableAndTransformInto

	| interpreter html |

	interpreter := WebInteractionInterpreter forClickOnComponent.
	interpreter temporarilyDisableAndTransformInto: [ :canvas | canvas span: 'Loading...' ].
	html := self configureTextInputWith: interpreter.
	self
		assert: html
		equals:
			'<input id="input-id2" type="text"/><script type="text/javascript">$("#input-id2").click(function(){$.ajax({"data":[disabledComponent=$(this).html(),$(this).addClass("willow-disabled-component").attr("disabled",true).html("<span>Loading...</span>"),"1"].join("&"),"complete":function(){$(".willow-disabled-component").attr("disabled",false).removeClass("willow-disabled-component").html(disabledComponent)},"dataType":"script","url":"/","error":handleAjaxErrorCall})});</script>'