tests-accessing
testForChildForm

	| html |

	html := self
		renderUsing: [ :canvas | 
			| asynchronousCall div |

			asynchronousCall := canvas jQuery ajax.
			SerializationCommand forChildForm priorityActions do: [ :action | action value: asynchronousCall value: canvas ].
			div := canvas div.
			canvas ensureIdFor: div.
			div script: (canvas jQuery this onClick: asynchronousCall) ].

	self
		assert: html
		equals: '<div id="div-id2"></div><script type="text/javascript">$("#div-id2").click(function(){$.ajax({"type":"POST","url":"/","data":["1",$(this).children("form").serialize()].join("&")})});</script>'