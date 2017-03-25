tests-accessing
testForCurrentObjectWithHiddenInputs

	| html |

	html := self
		renderUsing: [ :canvas | 
			| asynchronousCall div |

			asynchronousCall := canvas jQuery ajax.
			SerializationCommand forCurrentObjectWithHiddenInputs priorityActions do: [ :action | action value: asynchronousCall value: canvas ].
			div := canvas div.
			canvas ensureIdFor: div.
			div script: (canvas jQuery this onClick: asynchronousCall) ].

	self
		assert: html
		equals: '<div id="div-id2"></div><script type="text/javascript">$("#div-id2").click(function(){$.ajax({"url":"/","data":["1",$(this).next("input:hidden").addBack().serialize()].join("&")})});</script>'