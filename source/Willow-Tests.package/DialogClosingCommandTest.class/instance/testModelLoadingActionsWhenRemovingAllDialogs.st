tests-accessing
testModelLoadingActionsWhenRemovingAllDialogs

	| html |

	html := self
		renderUsing: [ :canvas | 
			| script anchor |

			script := canvas javascript.
			anchor := canvas anchor.
			canvas ensureIdFor: anchor.
			command modelLoadingActions do: [ :action | action value: script value: canvas ].
			anchor script: (canvas jQuery this onClick: script) ].

	self
		assert: html
		equals:
			'<a id="a-id1"></a><script type="text/javascript">$("#a-id1").click(function(){$("#willow-dialog-section").children("dialog").removeAttr("open")});</script>'