tests-accessing
testModelLoadingActions

	| html |

	html := self
		renderUsing: [ :canvas | 
			| script |

			script := canvas javascript.
			identifiedView identifyIn: canvas.
			command modelLoadingActions do: [ :action | action value: script value: canvas ].

			canvas anchor script: (canvas jQuery this onClick: script) ].

	self
		assert: html
		equals: '<a id="id2"></a><script type="text/javascript">$("#id2").click(function(){$("#test-id1").html("<span>Test</span>")});</script>'