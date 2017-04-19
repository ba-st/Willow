tests-Configuring-DOM
testSerializeContainerForm

	| interpreter html id |

	interpreter := WebInteractionInterpreter forChangeInComponentValue.
	id := '15'.

	html := self
		renderUsing: [ :canvas | 
			| textInput |

			textInput := canvas textInput.
			textInput id: id.
			interpreter serializeContainerForm.
			interpreter applyTo: textInput on: canvas ].

	self
		assert: html
		equals:
			'<input id="15" type="text"/><script type="text/javascript">$("#15").change(function(){$.ajax({"url":"/","data":["1",$(this).closest("form").find(":input").serialize()].join("&"),"dataType":"script","error":Willow.handleAjaxErrorCall})});</script>'