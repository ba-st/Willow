tests-accessing
testForParentForm

	| html |

	html := self
		renderUsing: [ :canvas | 
			| asynchronousCall input |

			asynchronousCall := canvas jQuery ajax.
			SerializationCommand forParentForm priorityActions do: [ :action | action value: asynchronousCall value: canvas ].
			input := canvas textInput.
			canvas ensureIdFor: input.
			input script: (canvas jQuery this onClick: asynchronousCall) ].

	self
		assert: html
		equals:
			'<input id="input-id2" type="text"/><script type="text/javascript">$("#input-id2").click(function(){$.ajax({"url":"/","data":["1",$(this).closest("form").find(":input").serialize()].join("&")})});</script>'