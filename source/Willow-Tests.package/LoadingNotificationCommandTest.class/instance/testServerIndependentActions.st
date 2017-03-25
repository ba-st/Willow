tests-accessing
testServerIndependentActions

	| html |

	html := self
		renderUsing: [ :canvas | 
			| script anchor |

			script := canvas javascript.
			command serverIndependentActions do: [ :action | action value: script value: canvas ].
			anchor := canvas anchor.
			canvas ensureIdFor: anchor.
			anchor script: (canvas jQuery this onClick: script) ].

	self
		assert: html
		equals:
			'<a id="a-id1"></a><script type="text/javascript">$("#a-id1").click(function(){$("#willow-notification-section").html("<div>Loading...</div>")});</script>'