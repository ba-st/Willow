tests-accessing
testModelLoadingActions

	| html |

	html := self
		renderUsing: [ :canvas | 
			| script |

			script := canvas javascript.
			command modelLoadingActions do: [ :action | action value: script value: canvas ].

			canvas anchor script: (canvas jQuery this onClick: script) ].

	self
		assert: html
		equals: '<a id="id1"></a><script type="text/javascript">$("#id1").click(function(){$("#id8")[0].scrollIntoView()});</script>'