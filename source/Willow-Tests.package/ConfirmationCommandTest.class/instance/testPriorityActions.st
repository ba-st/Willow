tests-accessing
testPriorityActions

	| html |

	html := self
		renderUsing: [ :canvas | 
			| asynchronousCall anchor |

			asynchronousCall := canvas jQuery ajax.
			command priorityActions do: [ :action | action value: asynchronousCall value: canvas ].
			anchor := canvas anchor.
			canvas ensureIdFor: anchor.
			anchor script: (canvas jQuery this onClick: asynchronousCall) ].

	self
		assert: html
		equals: '<a id="a-id1"></a><script type="text/javascript">$("#a-id1").click(function(){if(confirm("Do you want to proceed?")){$.ajax()}});</script>'