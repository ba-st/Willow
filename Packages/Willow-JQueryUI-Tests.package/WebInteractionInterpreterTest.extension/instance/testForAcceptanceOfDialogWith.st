*Willow-JQueryUI-Tests
testForAcceptanceOfDialogWith

	| interpreter html |

	interpreter := WebInteractionInterpreter forAcceptanceOfDialogWith: 'Click me!'.
	interpreter evaluate: [  ].
	html := self configureDialogWith: interpreter.
	self
		assert: html
		equals:
			'<div id="id2"></div><script type="text/javascript">$("#id2").dialog({"buttons":{"Click me!":function(){$.ajax({"type":"POST","url":"/","data":["1",$(this).children("form").serialize()].join("&"),"dataType":"script","error":function(x,t,e){invalidAction(x,t,e)}});$(this).dialog("close")}}});</script>'